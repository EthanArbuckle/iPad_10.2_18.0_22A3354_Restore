@implementation MFFakeMailboxUid

- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5
{
  return -[MFFakeMailboxUid initWithAccount:URLString:fullPath:isSpecial:](self, "initWithAccount:URLString:fullPath:isSpecial:", a3, a4, a5, 0);
}

- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5 isSpecial:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  MFFakeMailboxUid *v12;
  MFFakeMailboxUid *v13;
  objc_super v15;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFFakeMailboxUid;
  v12 = -[MFMailboxUid initWithAccount:](&v15, sel_initWithAccount_, a3);
  v13 = v12;
  if (v12)
  {
    -[MFFakeMailboxUid setFakeURLString:](v12, "setFakeURLString:", v10);
    -[MFFakeMailboxUid setFakeFullPath:](v13, "setFakeFullPath:", v11);
    -[MFFakeMailboxUid setFakeIsSpecialMailboxUid:](v13, "setFakeIsSpecialMailboxUid:", v6);
  }

  return v13;
}

- (BOOL)isStore
{
  return 1;
}

- (id)store
{
  return 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)fakeFullPath
{
  return self->_fakeFullPath;
}

- (void)setFakeFullPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)fakeURLString
{
  return self->_fakeURLString;
}

- (void)setFakeURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)fakeIsSpecialMailboxUid
{
  return self->_fakeIsSpecialMailboxUid;
}

- (void)setFakeIsSpecialMailboxUid:(BOOL)a3
{
  self->_fakeIsSpecialMailboxUid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeURLString, 0);
  objc_storeStrong((id *)&self->_fakeFullPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
