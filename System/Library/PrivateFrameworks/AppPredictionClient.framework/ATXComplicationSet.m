@implementation ATXComplicationSet

- (ATXComplicationSet)initWithComplications:(id)a3
{
  return -[ATXComplicationSet initWithComplications:localizedTitle:](self, "initWithComplications:localizedTitle:", a3, &stru_1E4D5DB30);
}

- (ATXComplicationSet)initWithComplications:(id)a3 localizedTitle:(id)a4
{
  id v7;
  id v8;
  ATXComplicationSet *v9;
  ATXComplicationSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXComplicationSet;
  v9 = -[ATXComplicationSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_complications, a3);
    objc_storeStrong((id *)&v10->_localizedTitle, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ATXComplicationSet complications](self, "complications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplicationSet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXComplicationSet *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("complicationsSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXComplicationSet initWithComplications:localizedTitle:](self, "initWithComplications:localizedTitle:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXComplicationSet complications](self, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("complicationsSet"));

  -[ATXComplicationSet localizedTitle](self, "localizedTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXComplicationSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXComplicationSet *v10;

  v5 = +[ATXComplicationSet allocWithZone:](ATXComplicationSet, "allocWithZone:");
  -[ATXComplicationSet complications](self, "complications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ATXComplicationSet localizedTitle](self, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[ATXComplicationSet initWithComplications:localizedTitle:](v5, "initWithComplications:localizedTitle:", v7, v9);

  return v10;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_complications, 0);
}

@end
