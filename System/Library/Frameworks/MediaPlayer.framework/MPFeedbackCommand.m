@implementation MPFeedbackCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;
  NSString *localizedTitle;
  NSString *localizedShortTitle;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType") != 128)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D4C7A0]);

  }
  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedTitle, *MEMORY[0x1E0D4C7B8]);
  localizedShortTitle = self->_localizedShortTitle;
  if (localizedShortTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedShortTitle, *MEMORY[0x1E0D4C7B0]);
  if (self->_presentationStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0D4C800]);

  }
  return v3;
}

- (void)setLocalizedTitle:(NSString *)localizedTitle
{
  objc_setProperty_nonatomic_copy(self, a2, localizedTitle, 88);
}

- (void)setActive:(BOOL)active
{
  if (self->_active != active)
  {
    self->_active = active;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3)
  {
    self->_presentationStyle = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setLocalizedShortTitle:(NSString *)localizedShortTitle
{
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v6 = localizedShortTitle;
  if (!-[NSString isEqualToString:](self->_localizedShortTitle, "isEqualToString:"))
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    v5 = self->_localizedShortTitle;
    self->_localizedShortTitle = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (id)newCommandEventWithState:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v10 = *MEMORY[0x1E0D4CC18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3 == -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v7);

  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
