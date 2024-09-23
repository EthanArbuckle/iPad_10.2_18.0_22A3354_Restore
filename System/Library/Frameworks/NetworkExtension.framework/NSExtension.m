@implementation NSExtension

- (id)extensionHostContextForUUID:(void *)a1
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NEProcessIdentity *v5;
  void *v6;
  id v7;
  SEL v8;
  SEL v9;
  id v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  if (a1)
  {
    objc_msgSend(a1, "_extensionContextForUUID:", a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
    {
      v4 = *(id *)(v2 + 72);
      if (v4
        || (objc_msgSend(v3, "_auxiliaryConnection"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v5 = [NEProcessIdentity alloc];
        -[NSObject _xpcConnection](v4, "_xpcConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NEProcessIdentity initFromXPCConnection:](v5, "initFromXPCConnection:", v6);
        objc_setProperty_atomic(v3, v8, v7, 64);

        if (objc_getProperty(v3, v9, 64, 1))
        {

          goto LABEL_7;
        }
        ne_log_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to create a NEProcessIdentity object", v13, 2u);
        }

      }
      else
      {
        ne_log_obj();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to derive the process identity, no vendor connection available", buf, 2u);
        }
      }

      v10 = 0;
      goto LABEL_14;
    }
LABEL_7:
    v10 = v3;
LABEL_14:

    return v10;
  }
  return 0;
}

@end
