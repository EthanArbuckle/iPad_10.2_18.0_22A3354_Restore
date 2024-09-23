@implementation DAIDSDestination

- (DAIDSDestination)initWithIDSDevice:(id)a3
{
  id v4;
  DAIDSDestination *v5;
  uint64_t v6;
  NSString *idsDestination;
  uint64_t v8;
  NSUUID *bluetoothID;
  uint64_t v10;
  NSString *uniqueID;
  uint64_t v12;
  NSString *uniqueIDOverride;
  uint64_t v14;
  NSNumber *locallyPaired;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DAIDSDestination;
  v5 = -[DAIDSDestination init](&v17, "init");
  if (v5)
  {
    v6 = IDSCopyIDForDevice(v4);
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nsuuid"));
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIDOverride"));
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isLocallyPaired")));
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v14;

  }
  return v5;
}

- (DAIDSDestination)initWithCoder:(id)a3
{
  id v4;
  DAIDSDestination *v5;
  id v6;
  uint64_t v7;
  NSString *idsDestination;
  id v9;
  uint64_t v10;
  NSUUID *bluetoothID;
  id v12;
  uint64_t v13;
  NSString *uniqueID;
  id v15;
  uint64_t v16;
  NSString *uniqueIDOverride;
  id v18;
  uint64_t v19;
  NSNumber *locallyPaired;

  v4 = a3;
  v5 = -[DAIDSDestination init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("destination"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("bluetoothID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uniqueID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uniqueIDOverride"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("locallyPaired"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination idsDestination](self, "idsDestination"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("destination"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bluetoothID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueID](self, "uniqueID"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("uniqueID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("uniqueIDOverride"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("locallyPaired"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;

  v4 = a3;
  v5 = objc_opt_class(DAIDSDestination);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIDOverride"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v9 = objc_opt_class(IDSDevice);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      v10 = -[DAIDSDestination isEqualToIDSDevice:](self, "isEqualToIDSDevice:", v4);
    }
    else
    {
      if (!qword_10016E918)
      {
        v22 = off_100133A48;
        v23 = 0;
        qword_10016E918 = _sl_dlopen(&v22, 0);
      }
      if (!qword_10016E918)
        goto LABEL_12;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2050000000;
      v11 = (void *)qword_10016E920;
      v21 = qword_10016E920;
      if (!qword_10016E920)
      {
        *(_QWORD *)&v22 = _NSConcreteStackBlock;
        *((_QWORD *)&v22 + 1) = 3221225472;
        v23 = sub_100028BA8;
        v24 = &unk_100133A68;
        v25 = &v18;
        sub_100028BA8((uint64_t)&v22);
        v11 = (void *)v19[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v18, 8);
      v13 = objc_opt_class(v12);
      if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
      {
        v10 = -[DAIDSDestination isEqualToNRDevice:](self, "isEqualToNRDevice:", v4, v18);
      }
      else
      {
LABEL_12:
        if (!qword_10016E928)
        {
          v22 = off_100133A88;
          v23 = 0;
          qword_10016E928 = _sl_dlopen(&v22, 0);
        }
        if (!qword_10016E928)
          goto LABEL_20;
        v18 = 0;
        v19 = &v18;
        v20 = 0x2050000000;
        v14 = (void *)qword_10016E930;
        v21 = qword_10016E930;
        if (!qword_10016E930)
        {
          *(_QWORD *)&v22 = _NSConcreteStackBlock;
          *((_QWORD *)&v22 + 1) = 3221225472;
          v23 = sub_100028CAC;
          v24 = &unk_100133A68;
          v25 = &v18;
          sub_100028CAC((uint64_t)&v22);
          v14 = (void *)v19[3];
        }
        v15 = objc_retainAutorelease(v14);
        _Block_object_dispose(&v18, 8);
        v16 = objc_opt_class(v15);
        if ((objc_opt_isKindOfClass(v4, v16) & 1) == 0)
        {
LABEL_20:
          v8 = 0;
          goto LABEL_21;
        }
        v10 = -[DAIDSDestination isEqualToSFDevice:](self, "isEqualToSFDevice:", v4, v18);
      }
    }
    v8 = v10;
  }
LABEL_21:

  return v8;
}

- (BOOL)isEqualToNRDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;

  v4 = a3;
  if (!qword_10016E918)
  {
    v20 = off_100133A48;
    v21 = 0;
    qword_10016E918 = _sl_dlopen(&v20, 0);
  }
  if (qword_10016E918)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x2020000000;
    v5 = (_QWORD *)qword_10016E938;
    v22 = (void *)qword_10016E938;
    if (!qword_10016E938)
    {
      v6 = (void *)sub_100028BFC();
      v5 = dlsym(v6, "NRDevicePropertyIsPaired");
      *(_QWORD *)(*((_QWORD *)&v20 + 1) + 24) = v5;
      qword_10016E938 = (uint64_t)v5;
    }
    _Block_object_dispose(&v20, 8);
    if (!v5)
    {
      sub_1000EB73C();
      __break(1u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", *v5));
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v8 = (void *)qword_10016E940;
    v19 = qword_10016E940;
    if (!qword_10016E940)
    {
      *(_QWORD *)&v20 = _NSConcreteStackBlock;
      *((_QWORD *)&v20 + 1) = 3221225472;
      v21 = (uint64_t)sub_100028DA0;
      v22 = &unk_100133A68;
      v23 = &v16;
      sub_100028DA0((uint64_t)&v20);
      v8 = (void *)v17[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v16, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedInstance", v16));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIDForNRDevice:", v4));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
    if (objc_msgSend(v7, "isEqualToNumber:", v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
      v14 = objc_msgSend(v11, "isEqual:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqualToIDSDevice:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uniqueIDOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)isEqualToSFDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  __int128 v10;
  uint64_t v11;

  v4 = a3;
  if (!qword_10016E928)
  {
    v10 = off_100133A88;
    v11 = 0;
    qword_10016E928 = _sl_dlopen(&v10, 0);
  }
  if (qword_10016E928)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination idsDestination](self, "idsDestination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination bluetoothID](self, "bluetoothID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueID](self, "uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination uniqueIDOverride](self, "uniqueIDOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSDestination locallyPaired](self, "locallyPaired"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idsDestination: %@; bluetoothID: %@; unqiueID: %@; uniqueIDOverride: %@; isLocallyPaired: %@"),
                   v3,
                   v4,
                   v5,
                   v6,
                   v7));

  return v8;
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothID, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (void)setUniqueIDOverride:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIDOverride, a3);
}

- (NSNumber)locallyPaired
{
  return self->_locallyPaired;
}

- (void)setLocallyPaired:(id)a3
{
  objc_storeStrong((id *)&self->_locallyPaired, a3);
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_locallyPaired, 0);
  objc_storeStrong((id *)&self->_uniqueIDOverride, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
}

@end
