@implementation SRPreferences

- (SRPreferences)init
{
  SRPreferences *v2;
  id v3;
  SRUIFPreferences *v4;
  SRUIFPreferences *internalPreferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRPreferences;
  v2 = -[SRPreferences init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)SRUIFPreferences);
    v4 = (SRUIFPreferences *)objc_msgSend(v3, "initWithSuiteName:", SRUIFPreferencesDefaultDomain);
    internalPreferences = v2->_internalPreferences;
    v2->_internalPreferences = v4;

    -[SRUIFPreferences setDelegate:](v2->_internalPreferences, "setDelegate:", v2);
  }
  return v2;
}

- (void)preferences:(id)a3 didChangeValueForKey:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SiriIsActive")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("LastKnownInterfaceOrientation")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("LastTranscriptVerticalContentOffset")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("LastVisibleTranscriptItemIndex")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("LastPinnedTranscriptItemIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("TapToEditTipCount")))
  {
    objc_msgSend(v6, "synchronize");
  }

}

- (BOOL)siriIsActive
{
  return -[SRUIFPreferences BOOLForKey:](self->_internalPreferences, "BOOLForKey:", CFSTR("SiriIsActive"));
}

- (void)setSiriIsActive:(BOOL)a3
{
  -[SRUIFPreferences setBool:forKey:](self->_internalPreferences, "setBool:forKey:", a3, CFSTR("SiriIsActive"));
}

- (int64_t)lastKnownInterfaceOrientation
{
  return (int64_t)-[SRUIFPreferences integerForKey:](self->_internalPreferences, "integerForKey:", CFSTR("LastKnownInterfaceOrientation"));
}

- (void)setLastKnownInterfaceOrientation:(int64_t)a3
{
  -[SRUIFPreferences setInteger:forKey:](self->_internalPreferences, "setInteger:forKey:", a3, CFSTR("LastKnownInterfaceOrientation"));
}

- (double)lastTranscriptVerticalContentOffset
{
  double result;

  -[SRUIFPreferences doubleForKey:](self->_internalPreferences, "doubleForKey:", CFSTR("LastTranscriptVerticalContentOffset"));
  return result;
}

- (void)setLastTranscriptVerticalContentOffset:(double)a3
{
  -[SRUIFPreferences setDouble:forKey:](self->_internalPreferences, "setDouble:forKey:", CFSTR("LastTranscriptVerticalContentOffset"), a3);
}

- (int64_t)lastVisibleTranscriptItemIndex
{
  return (int64_t)-[SRUIFPreferences integerForKey:](self->_internalPreferences, "integerForKey:", CFSTR("LastVisibleTranscriptItemIndex"));
}

- (void)setLastVisibleTranscriptItemIndex:(int64_t)a3
{
  -[SRUIFPreferences setInteger:forKey:](self->_internalPreferences, "setInteger:forKey:", a3, CFSTR("LastVisibleTranscriptItemIndex"));
}

- (void)setLastPinnedTranscriptItemIdentifier:(id)a3
{
  SRUIFPreferences *internalPreferences;
  id v4;

  internalPreferences = self->_internalPreferences;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  -[SRUIFPreferences setObject:forKey:](internalPreferences, "setObject:forKey:", v4, CFSTR("LastPinnedTranscriptItemIdentifier"));

}

- (NSUUID)lastPinnedTranscriptItemIdentifier
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUIFPreferences objectForKey:](self->_internalPreferences, "objectForKey:", CFSTR("LastPinnedTranscriptItemIdentifier")));
  v5 = objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (int64_t)showTapToEditTipCount
{
  return (int64_t)-[SRUIFPreferences integerForKey:](self->_internalPreferences, "integerForKey:", CFSTR("TapToEditTipCount"));
}

- (void)setShowTapToEditTipCount:(int64_t)a3
{
  -[SRUIFPreferences setInteger:forKey:](self->_internalPreferences, "setInteger:forKey:", a3, CFSTR("TapToEditTipCount"));
}

- (BOOL)hasPresentedSiriAssetsNotification
{
  return -[SRUIFPreferences BOOLForKey:](self->_internalPreferences, "BOOLForKey:", CFSTR("HasPresentedSiriAssetsNotification"));
}

- (void)setHasPresentedSiriAssetsNotification:(BOOL)a3
{
  -[SRUIFPreferences setBool:forKey:](self->_internalPreferences, "setBool:forKey:", a3, CFSTR("HasPresentedSiriAssetsNotification"));
}

- (BOOL)hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification
{
  return -[SRUIFPreferences BOOLForKey:](self->_internalPreferences, "BOOLForKey:", CFSTR("HasPresentedSiriAssetsDownloadNotification"));
}

- (void)setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:(BOOL)a3
{
  -[SRUIFPreferences setBool:forKey:](self->_internalPreferences, "setBool:forKey:", a3, CFSTR("HasPresentedSiriAssetsDownloadNotification"));
}

- (NSString)lastCoreDuetPunchoutID
{
  return self->_lastCoreDuetPunchoutID;
}

- (void)setLastCoreDuetPunchoutID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCoreDuetPunchoutID, 0);
  objc_storeStrong((id *)&self->_internalPreferences, 0);
}

@end
