@implementation FMDGenericMessage

- (FMDGenericMessage)initWithCoder:(id)a3
{
  id v4;
  FMDGenericMessage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDGenericMessage;
  v5 = -[FMDGenericMessage init](&v12, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_vibrate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericMessage setVibrate:](v5, "setVibrate:", objc_msgSend(v4, "decodeBoolForKey:", v6));

    v7 = objc_opt_class();
    NSStringFromSelector(sel_soundName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericMessage setSoundName:](v5, "setSoundName:", v9);

    NSStringFromSelector(sel_soundDuration);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericMessage setSoundDuration:](v5, "setSoundDuration:", objc_msgSend(v4, "decodeIntForKey:", v10));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = -[FMDGenericMessage vibrate](self, "vibrate");
  NSStringFromSelector(sel_vibrate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  -[FMDGenericMessage soundName](self, "soundName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[FMDGenericMessage soundDuration](self, "soundDuration");
  NSStringFromSelector(sel_soundDuration);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", v9, v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)vibrate
{
  return self->_vibrate;
}

- (void)setVibrate:(BOOL)a3
{
  self->_vibrate = a3;
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
{
  objc_storeStrong((id *)&self->_soundName, a3);
}

- (int)soundDuration
{
  return self->_soundDuration;
}

- (void)setSoundDuration:(int)a3
{
  self->_soundDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundName, 0);
}

@end
