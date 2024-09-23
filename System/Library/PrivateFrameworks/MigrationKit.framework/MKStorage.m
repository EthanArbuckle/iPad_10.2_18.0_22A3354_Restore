@implementation MKStorage

- (MKStorage)init
{
  MKStorage *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKStorage;
  v2 = -[MKStorage init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    objc_opt_class();
    v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BED8690]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = objc_msgSend(v5, "unsignedLongLongValue");
      else
        v4 = 0;

    }
    -[MKStorage setAvailableSpaceInBytes:](v2, "setAvailableSpaceInBytes:", v4);
    -[MKStorage setAvailableSpaceInMegabytes:](v2, "setAvailableSpaceInMegabytes:", v4 >> 20);
    -[MKStorage setAvailableSpaceInGigabytes:](v2, "setAvailableSpaceInGigabytes:", v2->_availableSpaceInMegabytes >> 10);
    -[MKStorage setAvailableSpaceInTerabytes:](v2, "setAvailableSpaceInTerabytes:", v2->_availableSpaceInGigabytes >> 10);

  }
  return v2;
}

- (unint64_t)availableSpaceInBytes
{
  return self->_availableSpaceInBytes;
}

- (void)setAvailableSpaceInBytes:(unint64_t)a3
{
  self->_availableSpaceInBytes = a3;
}

- (unint64_t)availableSpaceInMegabytes
{
  return self->_availableSpaceInMegabytes;
}

- (void)setAvailableSpaceInMegabytes:(unint64_t)a3
{
  self->_availableSpaceInMegabytes = a3;
}

- (unint64_t)availableSpaceInGigabytes
{
  return self->_availableSpaceInGigabytes;
}

- (void)setAvailableSpaceInGigabytes:(unint64_t)a3
{
  self->_availableSpaceInGigabytes = a3;
}

- (unint64_t)availableSpaceInTerabytes
{
  return self->_availableSpaceInTerabytes;
}

- (void)setAvailableSpaceInTerabytes:(unint64_t)a3
{
  self->_availableSpaceInTerabytes = a3;
}

@end
