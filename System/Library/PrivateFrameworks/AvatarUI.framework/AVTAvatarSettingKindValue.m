@implementation AVTAvatarSettingKindValue

- (AVTAvatarSettingKindValue)initWithSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  AVTAvatarSettingKindValue *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarSettingKindValue;
  result = -[AVTAvatarSettingKindValue init](&v6, sel_init);
  if (result)
  {
    result->_settingKind.destination = var0;
    result->_settingKind.category = var1;
  }
  return result;
}

+ (id)valueWithSettingKind:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSettingKind:", a3.var0, a3.var1);
}

- (BOOL)isEqual:(id)a3
{
  AVTAvatarSettingKindValue *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;

  v4 = (AVTAvatarSettingKindValue *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[AVTAvatarSettingKindValue settingKind](self, "settingKind");
      v7 = v6;
      v8 = -[AVTAvatarSettingKindValue settingKind](v4, "settingKind");
      v11 = v7 == v9 && v5 == v8;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[AVTAvatarSettingKindValue settingKind](self, "settingKind");
  return v2 ^ __ROR8__(v3, 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTAvatarSettingKindValue *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = [AVTAvatarSettingKindValue alloc];
  v5 = -[AVTAvatarSettingKindValue settingKind](self, "settingKind");
  return -[AVTAvatarSettingKindValue initWithSettingKind:](v4, "initWithSettingKind:", v5, v6);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind
{
  int64_t category;
  int64_t destination;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  category = self->_settingKind.category;
  destination = self->_settingKind.destination;
  result.var1 = category;
  result.var0 = destination;
  return result;
}

@end
