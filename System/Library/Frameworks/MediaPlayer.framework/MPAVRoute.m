@implementation MPAVRoute

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[MPAVRoute routeUID](self, "routeUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoute routeName](self, "routeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MPAVRoute routeType](self, "routeType");
    v9 = -[MPAVRoute routeSubtype](self, "routeSubtype");
    if (objc_msgSend(v6, "length"))
    {
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v5, "routeUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v6;
LABEL_5:
        v12 = objc_msgSend(v11, "isEqualToString:", v10);

LABEL_11:
        goto LABEL_12;
      }
    }
    else if (v8 == objc_msgSend(v5, "routeType") && v9 == objc_msgSend(v5, "routeSubtype"))
    {
      objc_msgSend(v5, "routeName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      goto LABEL_5;
    }
    v12 = 0;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)MPAVRoute;
  v12 = -[MPAVRoute isEqual:](&v14, sel_isEqual_, v4);
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  -[MPAVRoute routeUID](self, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoute routeName](self, "routeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPAVRoute routeType](self, "routeType");
  v6 = -[MPAVRoute routeSubtype](self, "routeSubtype");
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v3, "hash");
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6 + v5 + objc_msgSend(v4, "hash");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPAVRoute routeName](self, "routeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoute routeUID](self, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPAVRoute routeType](self, "routeType");
  if (v7 > 3)
    v8 = CFSTR("Undefined");
  else
    v8 = off_1E3158B00[v7];
  v9 = -[MPAVRoute routeSubtype](self, "routeSubtype");
  if (v9 > 0x1B)
    v10 = CFSTR("Undefined");
  else
    v10 = off_1E3158A20[v9];
  v11 = v10;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name=%@ uid=%@ type=%@ subtype=%@>"), v4, self, v5, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isB298Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8206"));

  return v3;
}

- (BOOL)isB515Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8202"));

  return v3;
}

- (BOOL)isB507Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8209"));

  return v3;
}

- (BOOL)isW1Route
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("76,8194")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MPAVRoute productIdentifier](self, "productIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsString:", CFSTR("76,8195")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[MPAVRoute productIdentifier](self, "productIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsString:", CFSTR("76,8197")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[MPAVRoute productIdentifier](self, "productIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsString:", CFSTR("76,8198")) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[MPAVRoute productIdentifier](self, "productIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "containsString:", CFSTR("76,8201")) & 1) != 0)
          {
            v4 = 1;
          }
          else
          {
            -[MPAVRoute productIdentifier](self, "productIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v9, "containsString:", CFSTR("76,8208"));

          }
        }

      }
    }

  }
  return v4;
}

- (BOOL)isH1Route
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("76,8207")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MPAVRoute productIdentifier](self, "productIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsString:", CFSTR("76,8203")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[MPAVRoute productIdentifier](self, "productIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsString:", CFSTR("76,8204")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[MPAVRoute productIdentifier](self, "productIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsString:", CFSTR("76,8205")) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[MPAVRoute productIdentifier](self, "productIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "containsString:", CFSTR("76,8206")) & 1) != 0)
          {
            v4 = 1;
          }
          else
          {
            -[MPAVRoute productIdentifier](self, "productIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "containsString:", CFSTR("76,8202")) & 1) != 0)
            {
              v4 = 1;
            }
            else
            {
              -[MPAVRoute productIdentifier](self, "productIdentifier");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v10, "containsString:", CFSTR("76,8208")) & 1) != 0)
              {
                v4 = 1;
              }
              else
              {
                -[MPAVRoute productIdentifier](self, "productIdentifier");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v11, "containsString:", CFSTR("76,8210")) & 1) != 0)
                {
                  v4 = 1;
                }
                else
                {
                  -[MPAVRoute productIdentifier](self, "productIdentifier");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = objc_msgSend(v12, "containsString:", CFSTR("76,8211"));

                }
              }

            }
          }

        }
      }

    }
  }

  return v4;
}

- (void)setPicked:(BOOL)a3
{
  self->_picked = a3;
}

- (BOOL)isPicked
{
  return self->_picked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_auxiliaryDevices, 0);
  objc_storeStrong((id *)&self->_clusterCompositionRoutes, 0);
  objc_storeStrong((id *)&self->_subRoutes, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeaderRouteUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_destroyWeak((id *)&self->_parentRoute);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_wirelessDisplayRoute, 0);
  objc_storeStrong((id *)&self->_avRouteDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

- (MPAVRoute)initWithCoder:(id)a3
{

  return 0;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (NSString)designatedGroupLeaderName
{
  return 0;
}

- (NSArray)routeNames
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_routeName)
  {
    v4[0] = self->_routeName;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (void)setRouteName:(id)a3
{
  NSString *v4;
  NSString *routeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  routeName = self->_routeName;
  self->_routeName = v4;

}

- (NSDictionary)avRouteDescription
{
  return self->_avRouteDescription;
}

- (void)setAVRouteDescription:(id)a3
{
  NSDictionary *v4;
  NSDictionary *avRouteDescription;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  avRouteDescription = self->_avRouteDescription;
  self->_avRouteDescription = v4;

}

- (BOOL)isAirPlayingToDevice
{
  return 0;
}

- (NSString)groupLeaderAirplayIdentifier
{
  return 0;
}

- (BOOL)isAppleTVRoute
{
  int64_t v3;

  v3 = -[MPAVRoute routeType](self, "routeType");
  if (v3 != 1)
    LOBYTE(v3) = -[MPAVRoute routeType](self, "routeType") == 2;
  return v3;
}

- (BOOL)isDeviceRoute
{
  int64_t v3;

  v3 = -[MPAVRoute routeSubtype](self, "routeSubtype");
  if (v3 != 1)
    LOBYTE(v3) = -[MPAVRoute routeSubtype](self, "routeSubtype") == 2;
  return v3;
}

- (BOOL)isProxyGroupPlayer
{
  return 0;
}

- (BOOL)isVolumeControlAvailable
{
  return 0;
}

- (BOOL)supportsGrouping
{
  return 0;
}

- (BOOL)supportsAirPlayGrouping
{
  return 0;
}

- (BOOL)supportsRemoteControl
{
  return 0;
}

- (BOOL)isSplitterCapable
{
  return 0;
}

- (BOOL)isSplitRoute
{
  return 0;
}

- (int64_t)numberOfOutputDevices
{
  return 1;
}

- (BOOL)isRoutingToWirelessDevice
{
  return 0;
}

- (MPAVRoute)wirelessDisplayRoute
{
  return self->_wirelessDisplayRoute;
}

- (void)setWirelessDisplayRoute:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessDisplayRoute, a3);
}

- (int64_t)passwordType
{
  return 0;
}

- (BOOL)isDisplayedAsPicked
{
  return -[MPAVRoute isPicked](self, "isPicked")
      || -[MPAVRoute isPicked](self->_wirelessDisplayRoute, "isPicked")
      || -[MPAVRoute isPickedOnPairedDevice](self, "isPickedOnPairedDevice");
}

- (int64_t)displayRouteType
{
  return self->_displayRouteType;
}

- (void)setDisplayRouteType:(int64_t)a3
{
  self->_displayRouteType = a3;
}

- (BOOL)isShareableRoute
{
  return -[MPAVRoute isAirpodsRoute](self, "isAirpodsRoute")
      || -[MPAVRoute isW1Route](self, "isW1Route")
      || -[MPAVRoute isH1Route](self, "isH1Route");
}

- (BOOL)isHeadphonesRoute
{
  unint64_t v2;

  v2 = -[MPAVRoute routeSubtype](self, "routeSubtype");
  return (v2 < 0xE) & (0x3804u >> v2);
}

- (BOOL)isW3Route
{
  return -[MPAVRoute isB698Route](self, "isB698Route")
      || -[MPAVRoute isB698CRoute](self, "isB698CRoute")
      || -[MPAVRoute isB768ERoute](self, "isB768ERoute")
      || -[MPAVRoute isB768MRoute](self, "isB768MRoute")
      || -[MPAVRoute isB768CHERoute](self, "isB768CHERoute")
      || -[MPAVRoute isB768CHMRoute](self, "isB768CHMRoute")
      || -[MPAVRoute isB735ERoute](self, "isB735ERoute")
      || -[MPAVRoute isB735MRoute](self, "isB735MRoute");
}

- (BOOL)isAirpodsRoute
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("76,8194")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MPAVRoute productIdentifier](self, "productIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "containsString:", CFSTR("76,8207")) & 1) != 0
      || -[MPAVRoute isB298Route](self, "isB298Route")
      || -[MPAVRoute isB515Route](self, "isB515Route")
      || -[MPAVRoute isB688Route](self, "isB688Route")
      || -[MPAVRoute isB698Route](self, "isB698Route")
      || -[MPAVRoute isB698CRoute](self, "isB698CRoute")
      || -[MPAVRoute isB768ERoute](self, "isB768ERoute")
      || -[MPAVRoute isB768MRoute](self, "isB768MRoute")
      || -[MPAVRoute isB768CHERoute](self, "isB768CHERoute")
      || -[MPAVRoute isB768CHMRoute](self, "isB768CHMRoute")
      || -[MPAVRoute isB735ERoute](self, "isB735ERoute")
      || -[MPAVRoute isB735MRoute](self, "isB735MRoute");

  }
  return v4;
}

- (BOOL)isB688Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8211"));

  return v3;
}

- (BOOL)isB698Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8212"));

  return v3;
}

- (BOOL)isB698CRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8228"));

  return v3;
}

- (BOOL)isB768ERoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8217"));

  return v3;
}

- (BOOL)isB768MRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8219"));

  return v3;
}

- (BOOL)isB768CHERoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8222"));

  return v3;
}

- (BOOL)isB768CHMRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8224"));

  return v3;
}

- (BOOL)isB735ERoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,5023"));

  return v3;
}

- (BOOL)isB735MRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,5024"));

  return v3;
}

- (BOOL)isBeatsRoute
{
  return -[MPAVRoute isBeatsSoloRoute](self, "isBeatsSoloRoute")
      || -[MPAVRoute isBeatsStudioRoute](self, "isBeatsStudioRoute")
      || -[MPAVRoute isBeatsStudioProRoute](self, "isBeatsStudioProRoute")
      || -[MPAVRoute isBeatsXRoute](self, "isBeatsXRoute")
      || -[MPAVRoute isPowerbeatsRoute](self, "isPowerbeatsRoute")
      || -[MPAVRoute isB364Route](self, "isB364Route")
      || -[MPAVRoute isB372Route](self, "isB372Route")
      || -[MPAVRoute isB419Route](self, "isB419Route")
      || -[MPAVRoute isB444Route](self, "isB444Route")
      || -[MPAVRoute isB494Route](self, "isB494Route")
      || -[MPAVRoute isB507Route](self, "isB507Route")
      || -[MPAVRoute isB607Route](self, "isB607Route");
}

- (BOOL)isB607Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8214"));

  return v3;
}

- (BOOL)isPowerbeatsRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8195"));

  return v3;
}

- (BOOL)isBeatsSoloRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8198"));

  return v3;
}

- (BOOL)isBeatsStudioRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8201"));

  return v3;
}

- (BOOL)isBeatsStudioProRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8215"));

  return v3;
}

- (BOOL)isBeatsXRoute
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8197"));

  return v3;
}

- (BOOL)isBeatsLegacyRoute
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend(v4, "containsString:", CFSTR("10507")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "containsString:", CFSTR("204"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isB372Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8208"));

  return v3;
}

- (BOOL)isB444Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8203"));

  return v3;
}

- (BOOL)isB419Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8204"));

  return v3;
}

- (BOOL)isB364Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8205"));

  return v3;
}

- (BOOL)isB494Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("76,8210"));

  return v3;
}

- (BOOL)isJ327Route
{
  void *v2;
  char v3;

  -[MPAVRoute productIdentifier](self, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("j327"));

  return v3;
}

- (BOOL)isAirPlayRoute
{
  return 0;
}

- (BOOL)isDeviceSpeakerRoute
{
  return 0;
}

- (BOOL)isDeviceSpeakerPhoneRoute
{
  return 0;
}

- (BOOL)isHearingDeviceRoute
{
  void *v2;
  char v3;

  -[MPAVRoute routeUID](self, "routeUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("-tlea"));

  return v3;
}

- (BOOL)isSmartAudio
{
  return -[MPAVRoute routeType](self, "routeType") == 3;
}

- (BOOL)isStereoPair
{
  return 0;
}

- (BOOL)isHomeTheaterB520Route
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MPAVRoute clusterComposition](self, "clusterComposition", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if ((v6 & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "modelID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v9, "containsString:", CFSTR("AudioAccessory5"));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return -[MPAVRoute isHomeTheaterRoute](self, "isHomeTheaterRoute") & v6;
}

- (BOOL)isTVRoute
{
  return -[MPAVRoute isAppleTVRoute](self, "isAppleTVRoute")
      || -[MPAVRoute routeSubtype](self, "routeSubtype") == 16
      || -[MPAVRoute isTVStickRoute](self, "isTVStickRoute")
      || -[MPAVRoute isSetTopBoxRoute](self, "isSetTopBoxRoute");
}

- (BOOL)isTVStickRoute
{
  return -[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == 23;
}

- (BOOL)isSetTopBoxRoute
{
  return -[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == 22;
}

- (BOOL)isPhoneRoute
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MPAVRoute isPhoneRoute]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isiOSRoute
{
  return -[MPAVRoute isPhoneRoute](self, "isPhoneRoute")
      || -[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == 25;
}

- (BOOL)isMacRoute
{
  return -[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == 24;
}

- (BOOL)isVisionRoute
{
  return -[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == 27;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return 0;
}

- (BOOL)headTrackedSpatialAudioEnabled
{
  return 0;
}

- (BOOL)isLowLatencyRoute
{
  return 0;
}

- (BOOL)supportsWirelessDisplay
{
  return self->_wirelessDisplayRoute != 0;
}

- (BOOL)containsDeviceWithSubtype:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (-[MPAVRoute originalRouteSubtype](self, "originalRouteSubtype") == a3)
    return 1;
  -[MPAVRoute clusterComposition](self, "clusterComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__MPAVRoute_containsDeviceWithSubtype___block_invoke;
  v10[3] = &__block_descriptor_40_e54_B24__0__MPAVOutputDeviceDescription_8__NSDictionary_16l;
  v10[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count") != 0;

  return v5;
}

- (BOOL)isNearby
{
  return 0;
}

- (BOOL)isKnown
{
  return 1;
}

- (BOOL)isSubRoute
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoute);
  v3 = WeakRetained != 0;

  return v3;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  MPAVRoute *wirelessDisplayRoute;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPAVRoute routeName](self, "routeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPAVRoute isPicked](self, "isPicked"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[MPAVRoute routeUID](self, "routeUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\", picked=%@ uid=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  wirelessDisplayRoute = self->_wirelessDisplayRoute;
  if (wirelessDisplayRoute)
  {
    -[MPAVRoute description](wirelessDisplayRoute, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("\n\t| Mirroring Route: %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  return v8;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (NSString)designatedGroupLeaderRouteUID
{
  return self->_designatedGroupLeaderRouteUID;
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (int64_t)pickableRouteType
{
  return self->_pickableRouteType;
}

- (int64_t)routeSubtype
{
  return self->_routeSubtype;
}

- (NSArray)clusterComposition
{
  return self->_clusterComposition;
}

- (NSArray)subRoutes
{
  return self->_subRoutes;
}

- (NSArray)clusterCompositionRoutes
{
  return self->_clusterCompositionRoutes;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (MPAVBatteryLevel)batteryLevel
{
  return self->_batteryLevel;
}

- (NSArray)auxiliaryDevices
{
  return self->_auxiliaryDevices;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_pickedOnPairedDevice;
}

- (BOOL)isPlayingOnPairedDevice
{
  return self->_playingOnPairedDevice;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (BOOL)isCarplayRoute
{
  return self->_carplayRoute;
}

- (BOOL)isHomePodRoute
{
  return self->_homePodRoute;
}

- (BOOL)isB520Route
{
  return self->_b520Route;
}

- (BOOL)isHomeTheaterRoute
{
  return self->_homeTheaterRoute;
}

- (BOOL)isLowFidelityRoute
{
  return self->_lowFidelityRoute;
}

- (BOOL)isClusterRoute
{
  return self->_clusterRoute;
}

- (BOOL)isAppleAccessory
{
  return self->_appleAccessory;
}

- (int64_t)clusterType
{
  return self->_clusterType;
}

- (BOOL)supportsPicking
{
  return self->_supportsPicking;
}

- (void)_externalDevice
{
  return self->_externalDevice;
}

- (BOOL)isPickable
{
  return self->_pickable;
}

- (MPAVRoute)parentRoute
{
  return (MPAVRoute *)objc_loadWeakRetained((id *)&self->_parentRoute);
}

- (void)setParentRoute:(id)a3
{
  objc_storeWeak((id *)&self->_parentRoute, a3);
}

- (int64_t)originalRouteSubtype
{
  return self->_originalRouteSubtype;
}

- (MPAVRouteConnection)connection
{
  return self->_connection;
}

BOOL __39__MPAVRoute_containsDeviceWithSubtype___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routeSubtype") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 withOverridesFromMRType:(unsigned int)a4
{
  int64_t v4;

  if (a3 == 11 || (a4 & 0xFFFFFFFD) != 1)
    return objc_msgSend(a1, "routeSubtypeForMRSubtype:mrType:");
  v4 = 9;
  if (a4 == 3)
    v4 = 15;
  if (a4 == 2)
    return 0;
  else
    return v4;
}

+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 mrType:(unsigned int)a4
{
  int64_t v4;
  BOOL v5;
  int64_t v6;
  int64_t result;

  switch(a3)
  {
    case 1u:
      v4 = 9;
      if (a4 != 1)
        v4 = 1;
      v5 = a4 == 2;
      v6 = 21;
      goto LABEL_8;
    case 2u:
      v5 = a4 == 2;
      v4 = 2;
      v6 = 11;
      goto LABEL_8;
    case 3u:
      v5 = a4 == 2;
      v4 = 3;
      v6 = 12;
LABEL_8:
      if (v5)
        result = v6;
      else
        result = v4;
      break;
    case 4u:
      result = 4;
      break;
    case 5u:
      result = 5;
      break;
    case 6u:
      result = 7;
      break;
    case 7u:
      result = 8;
      break;
    case 8u:
      result = 10;
      break;
    case 9u:
      result = 13;
      break;
    case 0xAu:
      result = 14;
      break;
    case 0xBu:
      result = 16;
      break;
    case 0xCu:
      result = 17;
      break;
    case 0xDu:
      result = 18;
      break;
    case 0xEu:
      result = 19;
      break;
    case 0xFu:
      result = 20;
      break;
    case 0x10u:
      result = 22;
      break;
    case 0x11u:
      result = 23;
      break;
    case 0x12u:
      result = 24;
      break;
    case 0x13u:
      result = 25;
      break;
    case 0x14u:
      result = 26;
      break;
    case 0x15u:
      result = 27;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)clusterCompositionForOutputDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  MPAVOutputDeviceDescription *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MPAVOutputDeviceDescription *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "deviceSubtype") == 15)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "clusterComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "clusterComposition");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = [MPAVOutputDeviceDescription alloc];
          v13 = objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:mrType:", objc_msgSend(v11, "deviceSubtype"), objc_msgSend(v11, "deviceType"));
          objc_msgSend(v11, "uid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "modelID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[MPAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:modelID:](v12, "initWithDeviceType:deviceSubtype:uid:modelID:", 0, v13, v14, v15);

          objc_msgSend(v6, "addObject:", v16);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)clusterTypeForMRClusterType:(unsigned int)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_193F0A668[a3 - 1];
}

@end
