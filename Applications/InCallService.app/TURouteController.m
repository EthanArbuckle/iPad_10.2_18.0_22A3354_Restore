@implementation TURouteController

- (TURoute)routeForSpeakerDisable
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController routes](self, "routes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isReceiver") & 1) != 0
          || objc_msgSend(v6, "isDefaultRoute") && (objc_msgSend(v6, "isSpeaker") & 1) == 0)
        {
          v3 = v6;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return (TURoute *)v3;
}

+ (unint64_t)priorityForRoute:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "deviceType");
  v5 = 6;
  if (v4 <= 0x22)
  {
    if (((1 << v4) & 0x298C0FFC0) != 0)
    {
      if (objc_msgSend(v3, "isGuest"))
        v5 = 5;
      else
        v5 = 4;
      if (objc_msgSend(v3, "isRecommended"))
        v5 = 3;
    }
    else
    {
      if (((1 << v4) & 0x4273F003ELL) != 0)
        goto LABEL_4;
      if (v4)
        goto LABEL_10;
      if ((objc_msgSend(v3, "isSpeaker") & 1) != 0
        || (objc_msgSend(v3, "isReceiver") & 1) != 0
        || (objc_msgSend(v3, "isDefaultRoute") & 1) != 0)
      {
        v5 = 1;
        goto LABEL_10;
      }
      if ((objc_msgSend(v3, "isWiredHeadset") & 1) != 0
        || (objc_msgSend(v3, "isWiredHeadphones") & 1) != 0
        || (objc_msgSend(v3, "isWirelessHeadset") & 1) != 0)
      {
LABEL_4:
        v5 = 2;
      }
      else if (objc_msgSend(v3, "isRecommended"))
      {
        v5 = 3;
      }
      else
      {
        v5 = 6;
      }
    }
  }
LABEL_10:

  return v5;
}

- (NSArray)sortedRoutes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController routes](self, "routes"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082F00;
  v6[3] = &unk_100286888;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", v6));

  return (NSArray *)v4;
}

- (BOOL)areNonRelayAuxiliaryRoutesAvailable
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController routes](self, "routes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "supportsRelay") & 1) == 0
          && (objc_msgSend(v6, "isAuxiliary") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)hasAirPodsAvailable
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController routes](self, "routes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "isAirPodsRoute") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)hasAirPodsInEar
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController pickedRoute](self, "pickedRoute"));
  if (objc_msgSend(v2, "isAirPodsRoute"))
    v3 = objc_msgSend(v2, "isPreferredAndActive");
  else
    v3 = 0;

  return v3;
}

- (UIImage)audioRouteGlyph
{
  void *v3;
  void *v4;

  if (-[TURouteController areAuxiliaryRoutesAvailable](self, "areAuxiliaryRoutesAvailable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController pickedRoute](self, "pickedRoute"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioRouteGlyphForDisplayStyle:", 0));

  }
  else
  {
    v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)fetchAudioControlsGlyphWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TURouteController pickedRoute](self, "pickedRoute"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000832E8;
  v7[3] = &unk_1002868B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAudioControlsGlyphWithCompletion:", v7);

}

@end
