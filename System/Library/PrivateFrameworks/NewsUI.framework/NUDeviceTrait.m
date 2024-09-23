@implementation NUDeviceTrait

- (NUDeviceTrait)initWithDeviceTraitSize:(unint64_t)a3
{
  NUDeviceTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUDeviceTrait;
  result = -[NUDeviceTrait init](&v5, sel_init);
  if (result)
    result->_deviceTraitSize = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NUDeviceTrait initWithDeviceTraitSize:]([NUDeviceTrait alloc], "initWithDeviceTraitSize:", -[NUDeviceTrait deviceTraitSize](self, "deviceTraitSize"));
}

- (BOOL)isLandscape
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isKeyWindow", (_QWORD)v12) & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (v9)
    {
      objc_msgSend(v9, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = (unint64_t)(objc_msgSend(v10, "interfaceOrientation") - 3) < 2;

      goto LABEL_12;
    }
    LOBYTE(v5) = 0;
  }
  else
  {
LABEL_9:
    v9 = v4;
LABEL_12:

  }
  return v5;
}

- (unint64_t)deviceTraitSize
{
  return self->_deviceTraitSize;
}

@end
