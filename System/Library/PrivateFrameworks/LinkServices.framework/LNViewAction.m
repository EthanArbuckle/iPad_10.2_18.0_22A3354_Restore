@implementation LNViewAction

- (LNViewAction)initWithActionIdentifier:(id)a3 viewIdentifier:(int64_t)a4 location:(LNViewLocation *)a5
{
  id v10;
  LNViewAction *v11;
  LNViewAction *v12;
  __int128 v13;
  __int128 v14;
  LNViewAction *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  if (v10)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNViewAction.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNViewAction.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewIdentifier"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNViewAction;
  v11 = -[LNViewAction init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionIdentifier, a3);
    v12->_viewIdentifier = a4;
    v13 = *(_OWORD *)&a5->x;
    v14 = *(_OWORD *)&a5->z;
    *(_OWORD *)&v12->_location.height = *(_OWORD *)&a5->height;
    *(_OWORD *)&v12->_location.z = v14;
    *(_OWORD *)&v12->_location.x = v13;
    v15 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNViewAction actionIdentifier](self, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNViewAction viewIdentifier](self, "viewIdentifier");
  LNViewLocationAsString((uint64_t *)&self->_location);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%ld) @ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNViewAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  LNViewAction *v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[3];
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("viewIdentifier"));
  if (v5)
  {
    v7 = v6;
    v14 = 0;
    v8 = (__int128 *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("location"), &v14);
    v9 = 0;
    if (v8 && v14 == 48)
    {
      v10 = *v8;
      v11 = v8[2];
      v13[1] = v8[1];
      v13[2] = v11;
      v13[0] = v10;
      self = -[LNViewAction initWithActionIdentifier:viewIdentifier:location:](self, "initWithActionIdentifier:viewIdentifier:location:", v5, v7, v13);
      v9 = self;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNViewAction actionIdentifier](self, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("actionIdentifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNViewAction viewIdentifier](self, "viewIdentifier"), CFSTR("viewIdentifier"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_location, 48, CFSTR("location"));

}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (int64_t)viewIdentifier
{
  return self->_viewIdentifier;
}

- (LNViewLocation)location
{
  __int128 v3;

  v3 = *(_OWORD *)&self->depth;
  *(_OWORD *)&retstr->x = *(_OWORD *)&self->width;
  *(_OWORD *)&retstr->z = v3;
  *(_OWORD *)&retstr->height = *(_OWORD *)&self[1].y;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
