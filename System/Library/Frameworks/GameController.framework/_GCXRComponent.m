@implementation _GCXRComponent

- (_GCXRComponent)initWithIdentifier:(id)a3
{
  id v4;
  _GCXRComponent *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCXRComponent;
  v5 = -[_GCXRComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (void)setController:(id)a3
{
  id WeakRetained;
  GCPhysicalInputProfile *v5;
  GCPhysicalInputProfile *physicalInput;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_controller, obj);
    objc_msgSend(obj, "physicalInputProfile");
    v5 = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
    physicalInput = self->_physicalInput;
    self->_physicalInput = v5;

    -[_GCXRComponent updateSkeletons](self, "updateSkeletons");
  }

}

+ (id)componentWithPhysicalInputProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _GCXRComponent *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerRing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [_GCXRComponent alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_GCXRComponent initWithIdentifier:](v7, "initWithIdentifier:", v8);

    if (v9)
    {
      objc_storeStrong((id *)(v9 + 24), a3);
      +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(v9 + 48);
      *(_QWORD *)(v9 + 48) = v10;

    }
  }
  else
  {
    v9 = 0;
  }

  return (id)v9;
}

- (void)updateSkeletons
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  _GCHandSkeleton *v9;
  GCPhysicalInputProfile *physicalInput;
  _GCHandSkeleton *v11;
  _GCHandSkeleton *leftHandSkeleton;
  _GCHandSkeleton **p_leftHandSkeleton;
  _GCHandSkeleton *v14;
  GCPhysicalInputProfile *v15;
  _GCHandSkeleton *v16;
  _GCHandSkeleton *rightHandSkeleton;
  _BYTE v18[992];

  -[NSMutableDictionary removeAllObjects](self->_handSkeletons, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_componentWithProtocol:", &unk_254DEB5F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "handedness");
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self->_physicalInput, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GCPropertyValueHandedness"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "value");
      v5 = (uint64_t)v8;
    }
    else
    {
      v5 = 0;
    }

  }
  if ((v5 | 2) == 3)
  {
    v9 = [_GCHandSkeleton alloc];
    physicalInput = self->_physicalInput;
    memcpy(v18, &kGCBoneDataRestingLeft, sizeof(v18));
    v11 = -[_GCHandSkeleton initWithBoneData:profile:handedness:](v9, "initWithBoneData:profile:handedness:", v18, physicalInput, 1);
    p_leftHandSkeleton = &self->_leftHandSkeleton;
    leftHandSkeleton = self->_leftHandSkeleton;
    self->_leftHandSkeleton = v11;

    -[NSMutableDictionary setValue:forKey:](self->_handSkeletons, "setValue:forKey:", self->_leftHandSkeleton, CFSTR("GCHandSkeletonLeft"));
    if (v5 == 1)
      goto LABEL_11;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v14 = [_GCHandSkeleton alloc];
    v15 = self->_physicalInput;
    memcpy(v18, &kGCBoneDataRestingRight, sizeof(v18));
    v16 = -[_GCHandSkeleton initWithBoneData:profile:handedness:](v14, "initWithBoneData:profile:handedness:", v18, v15, 2);
    p_leftHandSkeleton = &self->_rightHandSkeleton;
    rightHandSkeleton = self->_rightHandSkeleton;
    self->_rightHandSkeleton = v16;

    -[NSMutableDictionary setValue:forKey:](self->_handSkeletons, "setValue:forKey:", self->_rightHandSkeleton, CFSTR("GCHandSkeletonRight"));
    if (v5 == 2)
LABEL_11:
      -[NSMutableDictionary setValue:forKey:](self->_handSkeletons, "setValue:forKey:", *p_leftHandSkeleton, CFSTR("GCHandSkeletonAny"));
  }

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)handSkeletons
{
  return self->_handSkeletons;
}

- (void)setHandSkeletons:(id)a3
{
  objc_storeStrong((id *)&self->_handSkeletons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handSkeletons, 0);
  objc_storeStrong((id *)&self->_rightHandSkeleton, 0);
  objc_storeStrong((id *)&self->_leftHandSkeleton, 0);
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
