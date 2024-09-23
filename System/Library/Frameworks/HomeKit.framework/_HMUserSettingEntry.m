@implementation _HMUserSettingEntry

- (_HMUserSettingEntry)initWithKeyPath:(id)a3 constraintArray:(id)a4
{
  id v7;
  id v8;
  _HMUserSettingEntry *v9;
  _HMUserSettingEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMUserSettingEntry;
  v9 = -[_HMUserSettingEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_constraints, a4);
  }

  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
