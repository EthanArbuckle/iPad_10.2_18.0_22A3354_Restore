@implementation VSKeychainGenericPassword

- (void)_notifyWhileSettingPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[VSKeychainItem willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[VSKeychainItem setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v7);

  -[VSKeychainGenericPassword didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (id)_faultWhileAccessingPrimitiveValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VSKeychainItem willAccessValueForKey:](self, "willAccessValueForKey:", v4);
  -[VSKeychainItem primitiveValueForKey:](self, "primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItem didAccessValueForKey:](self, "didAccessValueForKey:", v4);

  return v5;
}

- (NSString)accessGroup
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("accessGroup"));
}

- (void)setAccessGroup:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("accessGroup"));

}

- (NSDate)creationDate
{
  return (NSDate *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("creationDate"));
}

- (NSDate)modificationDate
{
  return (NSDate *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("modificationDate"));
}

- (NSString)itemDescription
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("itemDescription"));
}

- (void)setItemDescription:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("itemDescription"));

}

- (NSString)comment
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("comment"));
}

- (void)setComment:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("comment"));

}

- (NSNumber)creatorCode
{
  return (NSNumber *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("creatorCode"));
}

- (void)setCreatorCode:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("creatorCode"));

}

- (NSNumber)typeCode
{
  return (NSNumber *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("typeCode"));
}

- (void)setTypeCode:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("typeCode"));

}

- (NSString)label
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("label"));

}

- (BOOL)isSynchronizable
{
  void *v2;
  char v3;

  -[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("synchronizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSynchronizable:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("synchronizable"));

}

- (NSString)viewHint
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("viewHint"));
}

- (void)setViewHint:(id)a3
{
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", a3, CFSTR("viewHint"));
}

- (BOOL)isInvisible
{
  void *v2;
  char v3;

  -[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("invisible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setInvisible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("invisible"));

}

- (BOOL)isNegative
{
  void *v2;
  char v3;

  -[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("negative"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNegative:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("negative"));

}

- (NSString)account
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("account"));
}

- (void)setAccount:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("account"));

}

- (NSString)service
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("service"));
}

- (void)setService:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("service"));

}

- (NSString)generic
{
  return (NSString *)-[VSKeychainGenericPassword _faultWhileAccessingPrimitiveValueForKey:](self, "_faultWhileAccessingPrimitiveValueForKey:", CFSTR("generic"));
}

- (void)setGeneric:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainGenericPassword _notifyWhileSettingPrimitiveValue:forKey:](self, "_notifyWhileSettingPrimitiveValue:forKey:", v4, CFSTR("generic"));

}

@end
