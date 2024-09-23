@implementation MRStaticRouteBannerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MRStaticRouteBannerRequest routeIdentifier](self, "routeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rid"));

  -[MRStaticRouteBannerRequest routeName](self, "routeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rn"));

  -[MRStaticRouteBannerRequest outputDeviceNames](self, "outputDeviceNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rns"));

  -[MRStaticRouteBannerRequest routeSymbolName](self, "routeSymbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rsn"));

  -[MRStaticRouteBannerRequest actionImageName](self, "actionImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ain"));

  -[MRStaticRouteBannerRequest soloModelID](self, "soloModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("smid"));

  -[MRStaticRouteBannerRequest soloDeviceEnclosureColor](self, "soloDeviceEnclosureColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("sdec"));

  -[MRStaticRouteBannerRequest userSelectedDeviceNames](self, "userSelectedDeviceNames");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("aseodns"));

}

- (MRStaticRouteBannerRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setRouteIdentifier:](self, "setRouteIdentifier:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setRouteName:](self, "setRouteName:", v6);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setOutputDeviceNames:](self, "setOutputDeviceNames:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsn"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setRouteSymbolName:](self, "setRouteSymbolName:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setActionImageName:](self, "setActionImageName:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setSoloModelID:](self, "setSoloModelID:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdec"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRStaticRouteBannerRequest setSoloDeviceEnclosureColor:](self, "setSoloDeviceEnclosureColor:", v14);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("aseodns"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRStaticRouteBannerRequest setUserSelectedDeviceNames:](self, "setUserSelectedDeviceNames:", v18);
  return self;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRStaticRouteBannerRequest routeIdentifier](self, "routeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeIdentifier: %@"), v7);

  -[MRStaticRouteBannerRequest routeName](self, "routeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeName: %@"), v8);

  -[MRStaticRouteBannerRequest outputDeviceNames](self, "outputDeviceNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeNames: %@"), v9);

  -[MRStaticRouteBannerRequest routeSymbolName](self, "routeSymbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeSymbolName: %@"), v10);

  -[MRStaticRouteBannerRequest actionImageName](self, "actionImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" actionImageName: %@"), v11);

  -[MRStaticRouteBannerRequest soloModelID](self, "soloModelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" soloModelID: %@"), v12);

  -[MRStaticRouteBannerRequest soloDeviceEnclosureColor](self, "soloDeviceEnclosureColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" soloDeviceEnclosureColor: %@"), v13);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_routeIdentifier, a3);
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
  objc_storeStrong((id *)&self->_routeName, a3);
}

- (NSArray)outputDeviceNames
{
  return self->_outputDeviceNames;
}

- (void)setOutputDeviceNames:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceNames, a3);
}

- (NSString)routeSymbolName
{
  return self->_routeSymbolName;
}

- (void)setRouteSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_routeSymbolName, a3);
}

- (NSString)actionImageName
{
  return self->_actionImageName;
}

- (void)setActionImageName:(id)a3
{
  objc_storeStrong((id *)&self->_actionImageName, a3);
}

- (NSString)soloModelID
{
  return self->_soloModelID;
}

- (void)setSoloModelID:(id)a3
{
  objc_storeStrong((id *)&self->_soloModelID, a3);
}

- (NSString)soloDeviceEnclosureColor
{
  return self->_soloDeviceEnclosureColor;
}

- (void)setSoloDeviceEnclosureColor:(id)a3
{
  objc_storeStrong((id *)&self->_soloDeviceEnclosureColor, a3);
}

- (NSArray)userSelectedDeviceNames
{
  return self->_userSelectedDeviceNames;
}

- (void)setUserSelectedDeviceNames:(id)a3
{
  objc_storeStrong((id *)&self->_userSelectedDeviceNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSelectedDeviceNames, 0);
  objc_storeStrong((id *)&self->_soloDeviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_soloModelID, 0);
  objc_storeStrong((id *)&self->_actionImageName, 0);
  objc_storeStrong((id *)&self->_routeSymbolName, 0);
  objc_storeStrong((id *)&self->_outputDeviceNames, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end
