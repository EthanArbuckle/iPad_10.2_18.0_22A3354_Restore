@implementation _GCDevicePIDVIDMatchingFilter

- (_GCDevicePIDVIDMatchingFilter)initWithVendorID:(id)a3 productIDs:(id)a4
{
  id v7;
  id v8;
  _GCDevicePIDVIDMatchingFilter *v9;
  _GCDevicePIDVIDMatchingFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePIDVIDMatchingFilter;
  v9 = -[_GCDevicePIDVIDMatchingFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vendorID, a3);
    objc_storeStrong((id *)&v10->_productIDs, a4);
  }

  return v10;
}

- (BOOL)match:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("VendorID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("ProductID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    if (-[NSNumber isEqualToNumber:](self->_vendorID, "isEqualToNumber:", v5))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v9 = self->_productIDs;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v9);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToNumber:", v7, (_QWORD)v13) & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_15;
            }
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)identifier
{
  NSNumber *vendorID;
  void *v3;
  void *v4;

  vendorID = self->_vendorID;
  -[NSArray firstObject](self->_productIDs, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("vid(%@).pid(%@)"), vendorID, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIDs, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end
