@implementation CADGenerationStampedObjectID

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  CADGenerationStampedObjectID *v4;
  CADGenerationStampedObjectID *v5;
  Class Class;
  Class v7;
  BOOL v8;
  CADGenerationStampedObjectID *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  CADGenerationStampedObjectID *v16;
  int v17;
  int v18;
  int v19;

  v4 = (CADGenerationStampedObjectID *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_17;
  }
  Class = object_getClass(self);
  v7 = object_getClass(v5);
  if (Class == v7)
  {
    v9 = v5;
    v10 = -[CADGenerationStampedObjectID entityType](self, "entityType");
    if (v10 != -[CADGenerationStampedObjectID entityType](v9, "entityType"))
      goto LABEL_15;
    v11 = -[CADGenerationStampedObjectID entityID](self, "entityID");
    if (v11 != -[CADGenerationStampedObjectID entityID](v9, "entityID"))
      goto LABEL_15;
    v12 = -[CADGenerationStampedObjectID isTemporary](self, "isTemporary");
    if (v12 != -[CADGenerationStampedObjectID isTemporary](v9, "isTemporary"))
      goto LABEL_15;
    v13 = -[CADGenerationStampedObjectID databaseID](self, "databaseID");
    if (v13 != -[CADGenerationStampedObjectID databaseID](v9, "databaseID"))
      goto LABEL_15;
    v14 = -[CADGenerationStampedObjectID restoreGeneration](self, "restoreGeneration");
    v15 = -[CADGenerationStampedObjectID restoreGeneration](v9, "restoreGeneration");
    goto LABEL_19;
  }
  if (v7 == (Class)objc_opt_class())
  {
    v16 = v5;
    v17 = -[CADGenerationStampedObjectID entityType](self, "entityType");
    if (v17 != -[CADGenerationStampedObjectID entityType](v16, "entityType")
      || (v18 = -[CADGenerationStampedObjectID entityID](self, "entityID"),
          v18 != -[CADGenerationStampedObjectID entityID](v16, "entityID"))
      || (v19 = -[CADGenerationStampedObjectID isTemporary](self, "isTemporary"),
          v19 != -[CADGenerationStampedObjectID isTemporary](v16, "isTemporary")))
    {
LABEL_15:
      v8 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v14 = -[CADGenerationStampedObjectID databaseID](self, "databaseID");
    v15 = -[CADGenerationStampedObjectID databaseID](v16, "databaseID");
LABEL_19:
    v8 = v14 == v15;
    goto LABEL_16;
  }
LABEL_5:
  v8 = 0;
LABEL_17:

  return v8;
}

- (int)restoreGeneration
{
  return self->_restoreGeneration;
}

- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5 generation:(int)a6
{
  CADGenerationStampedObjectID *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CADGenerationStampedObjectID;
  result = -[CADGenerationStampedObjectID initWithEntityType:entityID:databaseID:](&v8, sel_initWithEntityType_entityID_databaseID_, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  if (result)
    result->_restoreGeneration = a6;
  return result;
}

- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 generation:(int)a5
{
  return -[CADGenerationStampedObjectID initWithEntityType:entityID:databaseID:generation:](self, "initWithEntityType:entityID:databaseID:generation:", *(_QWORD *)&a3, *(_QWORD *)&a4, *MEMORY[0x1E0D0BE78], *(_QWORD *)&a5);
}

@end
