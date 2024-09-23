@implementation MADMultiModalInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInput)init
{
  MADMultiModalInput *v2;
  uint64_t v3;
  NSMutableArray *segments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADMultiModalInput;
  v2 = -[MADMultiModalInput init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;

  }
  return v2;
}

- (MADMultiModalInput)initWithText:(id)a3
{
  id v4;
  MADMultiModalInput *v5;
  uint64_t v6;
  NSMutableArray *segments;
  NSMutableArray *v8;
  MADMultiModalInputTextSegment *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInput;
  v5 = -[MADMultiModalInput init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v6;

    v8 = v5->_segments;
    v9 = -[MADMultiModalInputTextSegment initWithText:]([MADMultiModalInputTextSegment alloc], "initWithText:", v4);
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  return v5;
}

- (MADMultiModalInput)initWithCoder:(id)a3
{
  id v4;
  MADMultiModalInput *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *segments;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInput;
  v5 = -[MADMultiModalInput init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Segments"));
    v9 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_segments, CFSTR("Segments"));
}

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (BOOL)addText:(id)a3 error:(id *)a4
{
  NSMutableArray *segments;
  id v5;
  MADMultiModalInputTextSegment *v6;

  segments = self->_segments;
  v5 = a3;
  v6 = -[MADMultiModalInputTextSegment initWithText:]([MADMultiModalInputTextSegment alloc], "initWithText:", v5);

  -[NSMutableArray addObject:](segments, "addObject:", v6);
  return 1;
}

- (BOOL)addEntityUUID:(id)a3 error:(id *)a4
{
  NSMutableArray *segments;
  id v5;
  MADMultiModalInputEntitySegment *v6;

  segments = self->_segments;
  v5 = a3;
  v6 = -[MADMultiModalInputEntitySegment initWithEntityUUID:seed:]([MADMultiModalInputEntitySegment alloc], "initWithEntityUUID:seed:", v5, 0);

  -[NSMutableArray addObject:](segments, "addObject:", v6);
  return 1;
}

- (BOOL)addEntityUUID:(id)a3 seed:(unint64_t)a4 error:(id *)a5
{
  NSMutableArray *segments;
  id v7;
  MADMultiModalInputEntitySegment *v8;
  void *v9;
  MADMultiModalInputEntitySegment *v10;

  segments = self->_segments;
  v7 = a3;
  v8 = [MADMultiModalInputEntitySegment alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MADMultiModalInputEntitySegment initWithEntityUUID:seed:](v8, "initWithEntityUUID:seed:", v7, v9);

  -[NSMutableArray addObject:](segments, "addObject:", v10);
  return 1;
}

- (BOOL)_addPixelBuffer:(__CVBuffer *)a3 seed:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSMutableArray *segments;
  MADMultiModalInputImageSegment *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  CVPixelBufferGetIOSurface(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    segments = self->_segments;
    v11 = -[MADMultiModalInputImageSegment initWithSurface:seed:]([MADMultiModalInputImageSegment alloc], "initWithSurface:seed:", v9, v8);
    -[NSMutableArray addObject:](segments, "addObject:", v11);

  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2F90];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVPixelBuffer input must be IOSurface backed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, -18, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return -[MADMultiModalInput _addPixelBuffer:seed:error:](self, "_addPixelBuffer:seed:error:", a3, 0, a4);
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 seed:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[MADMultiModalInput _addPixelBuffer:seed:error:](self, "_addPixelBuffer:seed:error:", a3, v8, a5);

  return (char)a5;
}

- (BOOL)addPersonDescription:(id)a3 error:(id *)a4
{
  NSMutableArray *segments;
  id v5;
  MADMultiModalInputDescriptionSegment *v6;

  segments = self->_segments;
  v5 = a3;
  v6 = -[MADMultiModalInputTextSegment initWithText:]([MADMultiModalInputDescriptionSegment alloc], "initWithText:", v5);

  -[NSMutableArray addObject:](segments, "addObject:", v6);
  return 1;
}

- (BOOL)addFaceprint:(id)a3 error:(id *)a4
{
  NSMutableArray *segments;
  id v5;
  MADMultiModalInputFaceprintSegment *v6;

  segments = self->_segments;
  v5 = a3;
  v6 = -[MADMultiModalInputFaceprintSegment initWithFaceprint:]([MADMultiModalInputFaceprintSegment alloc], "initWithFaceprint:", v5);

  -[NSMutableArray addObject:](segments, "addObject:", v6);
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("segments: %@>"), self->_segments);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
