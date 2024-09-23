@implementation SCNPhysicsShape

- (SCNPhysicsShape)initWithContent:(id)a3 options:(id)a4
{
  SCNPhysicsShape *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsShape;
  v6 = -[SCNPhysicsShape init](&v8, sel_init);
  if (v6)
  {
    v6->_referenceObject = a3;
    v6->_options = (NSDictionary *)a4;
  }
  return v6;
}

- (SCNPhysicsShape)initWithCachedObject:(void *)a3 options:(id)a4
{
  SCNPhysicsShape *v6;
  SCNPhysicsShape *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNPhysicsShape;
  v6 = -[SCNPhysicsShape init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cachedObject = a3;
    v6->_options = (NSDictionary *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  SCNPhysicsShapeDestroyShape((uint64_t)self->_collisionShape);

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsShape;
  -[SCNPhysicsShape dealloc](&v3, sel_dealloc);
}

- (id)referenceObject
{
  return self->_referenceObject;
}

- (void)setReferenceObject:(id)a3
{
  id referenceObject;
  NSObject *v6;
  uint8_t v7[16];

  referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {
    if (a3 && referenceObject)
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1DCCB8000, v6, OS_LOG_TYPE_DEFAULT, "Warning: changing the content of a physics shape is not expected", v7, 2u);
      }
    }

    self->_referenceObject = a3;
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)_setTransforms:(id)a3
{

  self->_transforms = (NSArray *)a3;
}

- (btCollisionShape)_handle
{
  void *cachedObject;
  CFTypeID v5;
  __C3DGeometry *v6;
  btCollisionShape *ShapeForGeometry;
  __C3DMesh *v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  btCollisionShape *collisionShape;
  id referenceObject;
  btCollisionShape *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  __n128 v27;
  unint64_t v28;
  uint64_t v29;
  SCNVector3 v30;
  SCNVector3 v31;

  if (self->_collisionShape)
    return self->_collisionShape;
  cachedObject = self->_cachedObject;
  if (cachedObject)
  {
    v5 = CFGetTypeID(cachedObject);
    if (CFTypeIsC3DGeometry(v5))
    {
      v6 = (__C3DGeometry *)self->_cachedObject;
LABEL_8:
      ShapeForGeometry = (btCollisionShape *)_createShapeForGeometry(v6, self->_options);
      goto LABEL_14;
    }
    if (v5 == C3DNodeGetTypeID())
    {
      v8 = (__C3DMesh *)self->_cachedObject;
LABEL_13:
      ShapeForGeometry = (btCollisionShape *)_createShapeForNode(v8, self->_options);
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (__C3DGeometry *)objc_msgSend(self->_referenceObject, "geometryRef");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (__C3DMesh *)objc_msgSend(self->_referenceObject, "nodeRef");
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:
    if (!self->_collisionShape)
      return self->_collisionShape;
    goto LABEL_19;
  }
  ShapeForGeometry = (btCollisionShape *)_createShapeForArrayOfShapes((NSArray *)self->_referenceObject, self->_transforms);
LABEL_14:
  self->_collisionShape = ShapeForGeometry;
  if (!ShapeForGeometry)
    return self->_collisionShape;
LABEL_19:
  v9 = -[NSDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("SCNPhysicsShapeScaleKey"));
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "SCNVector3Value");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      v16 = v17;
      v14 = v17;
      v12 = v17;
    }
    if (v12 != 0.0 && v14 != 0.0 && v16 != 0.0)
    {
      v31.x = 1.0;
      v31.y = 1.0;
      v31.z = 1.0;
      v30.x = v12;
      v30.y = v14;
      v30.z = v16;
      if (!SCNVector3EqualToVector3(v30, v31))
      {
        collisionShape = self->_collisionShape;
        v28 = __PAIR64__(LODWORD(v14), LODWORD(v12));
        v29 = LODWORD(v16);
        (*((void (**)(btCollisionShape *, unint64_t *))collisionShape->var0 + 6))(collisionShape, &v28);
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      referenceObject = self->_referenceObject;
      v20 = self->_collisionShape;
      objc_msgSend(referenceObject, "scale");
      v22 = v21;
      objc_msgSend(referenceObject, "scale");
      v24 = v23;
      objc_msgSend(referenceObject, "scale");
      v28 = __PAIR64__(v24, v22);
      v29 = v25;
      (*((void (**)(btCollisionShape *, unint64_t *))v20->var0 + 6))(v20, &v28);
    }
  }
  v26 = -[NSDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("SCNPhysicsShapeCollisionMarginKey"), v28, v29);
  if (v26)
  {
    objc_msgSend(v26, "floatValue");
    if (v27.n128_f32[0] < 0.0)
      v27.n128_f32[0] = 0.0;
    (*((void (**)(btCollisionShape *, __n128))self->_collisionShape->var0 + 11))(self->_collisionShape, v27);
  }
  return self->_collisionShape;
}

+ (SCNPhysicsShape)shapeWithGeometry:(SCNGeometry *)geometry options:(NSDictionary *)options
{
  return (SCNPhysicsShape *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContent:options:", geometry, options);
}

+ (SCNPhysicsShape)shapeWithNode:(SCNNode *)node options:(NSDictionary *)options
{
  return (SCNPhysicsShape *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContent:options:", node, options);
}

+ (SCNPhysicsShape)shapeWithShapes:(NSArray *)shapes transforms:(NSArray *)transforms
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContent:options:", shapes, 0);
  objc_msgSend(v5, "_setTransforms:", transforms);
  return (SCNPhysicsShape *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)copy
{
  return -[SCNPhysicsShape copyWithZone:](self, "copyWithZone:", 0);
}

+ (id)defaultShapeForGeometry:(id)a3
{
  SCNPhysicsShape *v4;

  v4 = (SCNPhysicsShape *)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("SCNDefaultPhysicsShape")), "pointerValue");
  if (!v4)
  {
    v4 = +[SCNPhysicsShape shapeWithGeometry:options:](SCNPhysicsShape, "shapeWithGeometry:options:", a3, 0);
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4), CFSTR("SCNDefaultPhysicsShape"));
  }
  return v4;
}

- (void)_customEncodingOfSCNPhysicsShape:(id)a3
{
  NSArray *transforms;
  NSArray *v6;
  _QWORD v7[6];
  _QWORD v8[3];
  int v9;

  transforms = self->_transforms;
  if (transforms)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v9 = 0;
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSArray count](transforms, "count"), CFSTR("transformsCount"));
    v6 = self->_transforms;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SCNPhysicsShape__customEncodingOfSCNPhysicsShape___block_invoke;
    v7[3] = &unk_1EA59F8D0;
    v7[4] = a3;
    v7[5] = v8;
    -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v7);
    _Block_object_dispose(v8, 8);
  }
}

uint64_t __52__SCNPhysicsShape__customEncodingOfSCNPhysicsShape___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _OWORD v9[4];

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  v7 = (const char *)objc_msgSend(v3, "stringWithFormat:", CFSTR("transform%d"), v6);
  if (a2)
    objc_msgSend(a2, "SCNMatrix4Value");
  else
    memset(v9, 0, sizeof(v9));
  return SCNEncodeSCNMatrix4(v4, v7, (uint64_t)v9);
}

- (void)_customDecodingOfSCNPhysicsShape:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *transforms;
  void *v9;
  _OWORD v10[4];

  v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("transformsCount"));
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    self->_transforms = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
    do
    {
      transforms = self->_transforms;
      v9 = (void *)MEMORY[0x1E0CB3B18];
      SCNDecodeSCNMatrix4(a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transform%d"), v7), v10);
      -[NSArray addObject:](transforms, "addObject:", objc_msgSend(v9, "valueWithSCNMatrix4:", v10));
      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id referenceObject;
  NSDictionary *options;

  -[SCNPhysicsShape _customEncodingOfSCNPhysicsShape:](self, "_customEncodingOfSCNPhysicsShape:");
  referenceObject = self->_referenceObject;
  if (referenceObject)
    objc_msgSend(a3, "encodeObject:forKey:", referenceObject, CFSTR("referenceObject"));
  options = self->_options;
  if (options)
    objc_msgSend(a3, "encodeObject:forKey:", options, CFSTR("options"));
}

- (SCNPhysicsShape)initWithCoder:(id)a3
{
  SCNPhysicsShape *v4;
  _BOOL8 v5;
  void *v6;
  objc_super v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsShape;
  v4 = -[SCNPhysicsShape init](&v8, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNPhysicsShape _customDecodingOfSCNPhysicsShape:](v4, "_customDecodingOfSCNPhysicsShape:", a3);
    v6 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    v9[3] = objc_opt_class();
    -[SCNPhysicsShape setReferenceObject:](v4, "setReferenceObject:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4)), CFSTR("referenceObject")));
    v4->_options = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("options"));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sourceObject
{
  return self->_referenceObject;
}

@end
