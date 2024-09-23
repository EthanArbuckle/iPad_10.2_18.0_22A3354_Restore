@implementation SGMailClientUtilMock

- (SGMailClientUtilMock)init
{
  SGMailClientUtilMock *v2;
  uint64_t v3;
  EAEmailAddressSet *vips;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGMailClientUtilMock;
  v2 = -[SGMailClientUtilMock init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    vips = v2->_vips;
    v2->_vips = (EAEmailAddressSet *)v3;

  }
  return v2;
}

- (id)allVIPEmailAddresses
{
  return self->_vips;
}

- (EAEmailAddressSet)vips
{
  return self->_vips;
}

- (void)setVips:(id)a3
{
  objc_storeStrong((id *)&self->_vips, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vips, 0);
}

@end
