@implementation AVTRenderingScope

+ (double)widthForRenderingType:(int64_t)a3 options:(unint64_t)a4
{
  double result;
  _BOOL4 v5;
  double *v6;

  result = 102.0;
  switch(a3)
  {
    case 'd':
      result = 84.0;
      if ((a4 & 1) == 0)
        result = 114.0;
      if ((a4 & 2) != 0)
        return 83.0;
      return result;
    case 'e':
      return result;
    case 'f':
      return 130.0;
    case 'g':
      return 52.0;
    default:
      if (a3 == 3)
      {
        v5 = (a4 & 1) == 0;
        v6 = (double *)&unk_1DCA6A1A0;
        return v6[v5];
      }
      if (a3 == 2)
      {
        v5 = (a4 & 1) == 0;
        v6 = (double *)&unk_1DCA6A1B0;
        return v6[v5];
      }
      return 166.0;
  }
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7
{
  double v7;

  LODWORD(v7) = 1.0;
  return -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:sizeModifier:](self, "initWithRenderingType:scale:options:framingMode:pose:sizeModifier:", a3, a5, a6, a7, a4, v7);
}

- (id)cacheableResourceAssociatedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[AVTRenderingScope framingModeIdentifier](self, "framingModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTRenderingScope framingModeIdentifier](self, "framingModeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR("_%@"), v7);
  }
  -[AVTRenderingScope pose](self, "pose");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AVTRenderingScope pose](self, "pose");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_avtui_identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR("_%@"), v10);
  }
  v11 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope size](self, "size");
  v13 = v12;
  -[AVTRenderingScope size](self, "size");
  v15 = v14;
  -[AVTRenderingScope scale](self, "scale");
  objc_msgSend(v3, "appendFormat:", CFSTR("_e%0.2g_o%lu_%2.2fx%2.2fAt%2.2fx"), 0x3FF0000000000000, v11, v13, v15, v16);
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (id)gridThumbnailScope
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = objc_alloc((Class)a1);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "scopeOptionsForEnvironment:", v7);
  v9 = *MEMORY[0x1E0D005D8];
  objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithRenderingType:scale:options:framingMode:pose:", 3, v8, v9, v10, v5);

  return v11;
}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (unint64_t)cacheableResourceAssociatedCost
{
  double v3;
  double v4;
  double v5;

  -[AVTRenderingScope size](self, "size");
  v4 = v3;
  -[AVTRenderingScope size](self, "size");
  return (unint64_t)(v4 * v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTRenderingScope)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  AVTRenderingScope *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("framingMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("pose"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00658]), "initWithDictionaryRepresentation:", v16);
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
  v19 = v18;
  v21 = v20;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:size:](self, "initWithRenderingType:scale:options:framingMode:pose:size:", v6, +[AVTRenderingScope scopeOptionsForEnvironment:](AVTRenderingScope, "scopeOptionsForEnvironment:", v22), v10, v17, v9, v19, v21);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a3;
  objc_msgSend(v4, "numberWithInt:", -[AVTRenderingScope renderingType](self, "renderingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("renderingType"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AVTRenderingScope scale](self, "scale");
  *(float *)&v7 = v7;
  objc_msgSend(v6, "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("scale"));

  -[AVTRenderingScope framingMode](self, "framingMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("framingMode"));

  -[AVTRenderingScope pose](self, "pose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("pose"));

  -[AVTRenderingScope size](self, "size");
  objc_msgSend(v12, "encodeCGSize:forKey:", CFSTR("size"));

}

+ (id)thumbnailScope
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = objc_alloc((Class)a1);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRenderingType:scale:options:", 1, objc_msgSend(a1, "scopeOptionsForEnvironment:", v7), v5);

  return v8;
}

+ (id)largeThumbnailScope
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = objc_alloc((Class)a1);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRenderingType:scale:options:", 2, objc_msgSend(a1, "scopeOptionsForEnvironment:", v7), v5);

  return v8;
}

+ (id)listControllerThumbnailScope
{
  void *v3;
  double v4;
  double v5;
  AVTRenderingScope *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AVTRenderingScope *v11;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = [AVTRenderingScope alloc];
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "scopeOptionsForEnvironment:", v7);
  v9 = *MEMORY[0x1E0D005C0];
  objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:](v6, "initWithRenderingType:scale:options:framingMode:pose:", 2, v8, v9, v10, v5);

  return v11;
}

+ (id)funCamCarouselThumbnailScope
{
  void *v3;
  double v4;
  double v5;
  AVTRenderingScope *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AVTRenderingScope *v11;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = [AVTRenderingScope alloc];
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "scopeOptionsForEnvironment:", v7);
  v9 = *MEMORY[0x1E0D005D0];
  objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:](v6, "initWithRenderingType:scale:options:framingMode:pose:", 102, v8, v9, v10, v5);

  return v11;
}

+ (id)simplePickerThumbnailScope
{
  void *v3;
  double v4;
  double v5;
  AVTRenderingScope *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AVTRenderingScope *v11;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;

  v6 = [AVTRenderingScope alloc];
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "scopeOptionsForEnvironment:", v7);
  v9 = *MEMORY[0x1E0D005D8];
  objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:](v6, "initWithRenderingType:scale:options:framingMode:pose:", 103, v8, v9, v10, v5);

  return v11;
}

+ (unint64_t)scopeOptionsForEnvironment:(id)a3
{
  id v3;
  unint64_t v4;
  double v5;

  v3 = a3;
  v4 = (objc_msgSend(v3, "deviceIsPad") & 1) != 0 || objc_msgSend(v3, "deviceIsMac");
  objc_msgSend(v3, "mainScreenSize");
  if (v5 <= 375.0)
    v4 |= 2uLL;

  return v4;
}

+ (double)thumbnailHeightRatioForFramingMode:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 1.2;
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D005E0]) & 1) == 0
    && (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D005E8]) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D005D0]))
      v4 = 1.31;
    else
      v4 = 1.0;
  }

  return v4;
}

+ (double)extraMagnifyingFactorForFramingMode:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0D005D0]);
  result = 1.2;
  if (!v3)
    return 1.0;
  return result;
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4
{
  return -[AVTRenderingScope initWithRenderingType:scale:options:](self, "initWithRenderingType:scale:options:", a3, 0, a4);
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5
{
  return -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:](self, "initWithRenderingType:scale:options:framingMode:pose:", a3, a5, 0, 0, a4);
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 sizeModifier:(float)a8
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  AVTRenderingScope *v19;

  v14 = a7;
  v15 = a6;
  objc_msgSend((id)objc_opt_class(), "widthForRenderingType:options:", a3, a5);
  v17 = v16;
  objc_msgSend((id)objc_opt_class(), "thumbnailHeightRatioForFramingMode:", v15);
  v19 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:size:](self, "initWithRenderingType:scale:options:framingMode:pose:size:", a3, a5, v15, v14, a4, v17 * a8, v17 * a8 * v18);

  return v19;
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 size:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  NSString *v15;
  id v16;
  AVTRenderingScope *v17;
  AVTRenderingScope *v18;
  objc_super v20;

  height = a8.height;
  width = a8.width;
  v15 = (NSString *)a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AVTRenderingScope;
  v17 = -[AVTRenderingScope init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_scale = a4;
    v17->_framingMode = v15;
    v17->_renderingType = a3;
    v17->_options = a5;
    objc_storeStrong((id *)&v17->_pose, a7);
    v18->_size.width = width;
    v18->_size.height = height;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTRenderingScope *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v5 = (AVTRenderingScope *)a3;
  if (v5 == self)
  {
    v11 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  v6 = -[AVTRenderingScope renderingType](self, "renderingType");
  if (v6 != -[AVTRenderingScope renderingType](v5, "renderingType"))
    goto LABEL_22;
  -[AVTRenderingScope framingMode](self, "framingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[AVTRenderingScope framingMode](v5, "framingMode"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AVTRenderingScope framingMode](self, "framingMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTRenderingScope framingMode](v5, "framingMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v7)
    {

      if (!v10)
        goto LABEL_22;
    }
    else
    {

      if ((v10 & 1) == 0)
        goto LABEL_22;
    }
  }
  -[AVTRenderingScope pose](self, "pose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (-[AVTRenderingScope pose](v5, "pose"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AVTRenderingScope pose](self, "pose");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTRenderingScope pose](v5, "pose");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v12)
    {

      if (!v15)
        goto LABEL_22;
      goto LABEL_17;
    }

    if ((v15 & 1) == 0)
    {
LABEL_22:
      v11 = 0;
      goto LABEL_23;
    }
  }
LABEL_17:
  -[AVTRenderingScope scale](self, "scale");
  v17 = v16;
  -[AVTRenderingScope scale](v5, "scale");
  if (v17 != v18)
    goto LABEL_22;
  v19 = -[AVTRenderingScope options](self, "options");
  if (v19 != -[AVTRenderingScope options](v5, "options"))
    goto LABEL_22;
  -[AVTRenderingScope size](self, "size");
  v21 = v20;
  v23 = v22;
  -[AVTRenderingScope size](v5, "size");
  v11 = v23 == v25 && v21 == v24;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  CGSize v19;
  CGSize v20;

  *((_QWORD *)&v4 + 1) = -[AVTRenderingScope options](self, "options");
  *(_QWORD *)&v4 = -[AVTRenderingScope options](self, "options");
  v3 = v4 >> 54;
  -[AVTRenderingScope size](self, "size");
  NSStringFromCGSize(v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderingScope size](self, "size");
  NSStringFromCGSize(v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v4 + 1) = v5;
  *(_QWORD *)&v4 = v6;
  v7 = v4 >> 52;
  *((_QWORD *)&v4 + 1) = -[AVTRenderingScope renderingType](self, "renderingType");
  *(_QWORD *)&v4 = -[AVTRenderingScope renderingType](self, "renderingType");
  v8 = v7 ^ v3 ^ (v4 >> 48);
  -[AVTRenderingScope scale](self, "scale");
  v10 = (unint64_t)v9;
  -[AVTRenderingScope scale](self, "scale");
  *((_QWORD *)&v4 + 1) = v10;
  *(_QWORD *)&v4 = (unint64_t)v11;
  v12 = v4 >> 43;
  -[AVTRenderingScope framingMode](self, "framingMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  -[AVTRenderingScope framingMode](self, "framingMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v4 + 1) = v14;
  *(_QWORD *)&v4 = objc_msgSend(v15, "hash");
  -[AVTRenderingScope pose](self, "pose");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8 ^ (v4 >> 32) ^ objc_msgSend(v16, "hash") ^ v12;

  return v17;
}

- (id)copyWithSize:(CGSize)a3 framingMode:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  int64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = objc_alloc((Class)objc_opt_class());
  v9 = -[AVTRenderingScope renderingType](self, "renderingType");
  -[AVTRenderingScope scale](self, "scale");
  v11 = v10;
  v12 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope pose](self, "pose");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithRenderingType:scale:options:framingMode:pose:size:", v9, v12, v7, v13, v11, width, height);

  return v14;
}

- (id)copyWithPose:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[AVTRenderingScope renderingType](self, "renderingType");
  -[AVTRenderingScope scale](self, "scale");
  v8 = v7;
  v9 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope framingMode](self, "framingMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderingScope size](self, "size");
  v13 = (void *)objc_msgSend(v5, "initWithRenderingType:scale:options:framingMode:pose:size:", v6, v9, v10, v4, v8, v11, v12);

  return v13;
}

- (id)copyWithFramingMode:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[AVTRenderingScope renderingType](self, "renderingType");
  -[AVTRenderingScope scale](self, "scale");
  v8 = v7;
  v9 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope pose](self, "pose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithRenderingType:scale:options:framingMode:pose:", v6, v9, v4, v10, v8);

  return v11;
}

- (id)copyWithSizeModifier:(float)a3
{
  double v4;
  float v5;
  id v6;
  int64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  v4 = a3;
  if (v4 > 1.0)
    v4 = 1.0;
  if (v4 < 0.0)
    v4 = 0.0;
  v5 = v4;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = -[AVTRenderingScope renderingType](self, "renderingType");
  -[AVTRenderingScope scale](self, "scale");
  v9 = v8;
  v10 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope framingMode](self, "framingMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderingScope pose](self, "pose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = v5;
  v14 = (void *)objc_msgSend(v6, "initWithRenderingType:scale:options:framingMode:pose:sizeModifier:", v7, v10, v11, v12, v9, v13);

  return v14;
}

- (id)copyApplyingPoseOverride:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[AVTRenderingScope pose](self, "pose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVTRenderingScope pose](self, "pose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "poseByMergingPose:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  v8 = objc_alloc((Class)objc_opt_class());
  v9 = -[AVTRenderingScope renderingType](self, "renderingType");
  -[AVTRenderingScope scale](self, "scale");
  v11 = v10;
  v12 = -[AVTRenderingScope options](self, "options");
  -[AVTRenderingScope framingMode](self, "framingMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithRenderingType:scale:options:framingMode:pose:", v9, v12, v13, v7, v11);

  return v14;
}

- (id)adaptedFramingModeForObjectType:(int64_t)a3
{
  void *v5;
  int v6;
  id v7;

  -[AVTRenderingScope framingMode](self, "framingMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D005D8]);

  if (a3 == 3 && v6)
  {
    v7 = (id)*MEMORY[0x1E0D005C0];
  }
  else
  {
    -[AVTRenderingScope framingMode](self, "framingMode");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)framingModeIdentifier
{
  void *v2;
  void *v3;

  -[AVTRenderingScope framingMode](self, "framingMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  CGSize v17;

  v16.receiver = self;
  v16.super_class = (Class)AVTRenderingScope;
  -[AVTRenderingScope description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVTRenderingScope renderingType](self, "renderingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" type: %@"), v5);

  -[AVTRenderingScope size](self, "size");
  NSStringFromCGSize(v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" size: %@"), v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AVTRenderingScope scale](self, "scale");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" scale: %@"), v8);

  -[AVTRenderingScope framingMode](self, "framingMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AVTRenderingScope framingMode](self, "framingMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" framingMode: %@"), v10);

  }
  -[AVTRenderingScope pose](self, "pose");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVTRenderingScope pose](self, "pose");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_avtui_identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" pose: %@"), v13);

  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (float)sizeModifier
{
  return self->_sizeModifier;
}

- (int64_t)renderingType
{
  return self->_renderingType;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pose, 0);
}

@end
