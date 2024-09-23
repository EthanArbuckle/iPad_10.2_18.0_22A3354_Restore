@implementation SKUniform

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  float v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  double v52;
  float v53;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  double v60;
  float v61;
  double v62;
  float v63;
  double v64;
  float v65;
  double v66;
  float v67;
  float v68;
  void *v69;
  void *v70;
  void *v71;
  float v73;
  double v74;
  double v75;
  double v76;
  double v77;
  float v78;
  double v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  double v86;
  float v87;

  switch(self->_type)
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform floatValue](self, "floatValue");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%.3f"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("Float");
      goto LABEL_7;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform vectorFloat2Value](self, "vectorFloat2Value");
      v82 = v9;
      -[SKUniform vectorFloat2Value](self, "vectorFloat2Value");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("{%.3f, %.3f}"), v82, v10);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatVector2");
      goto LABEL_7;
    case 3:
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform vectorFloat3Value](self, "vectorFloat3Value");
      v83 = v12;
      -[SKUniform vectorFloat3Value](self, "vectorFloat3Value");
      v80 = v13;
      -[SKUniform vectorFloat3Value](self, "vectorFloat3Value");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("{%.3f, %.3f, %.3f}"), v83, v80, v14);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatVector3");
      goto LABEL_7;
    case 4:
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform vectorFloat4Value](self, "vectorFloat4Value");
      v84 = v16;
      -[SKUniform vectorFloat4Value](self, "vectorFloat4Value");
      v81 = v17;
      -[SKUniform vectorFloat4Value](self, "vectorFloat4Value");
      v78 = v18;
      -[SKUniform vectorFloat4Value](self, "vectorFloat4Value");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("{%.3f, %.3f, %.3f, %.3f}"), v84, v81, v78, v19);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatVector4");
LABEL_7:
      v7 = (__CFString *)v5;
      break;
    case 5:
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform matrixFloat2x2Value](self, "matrixFloat2x2Value");
      v22 = v21;
      -[SKUniform matrixFloat2x2Value](self, "matrixFloat2x2Value");
      v24 = v23;
      -[SKUniform matrixFloat2x2Value](self, "matrixFloat2x2Value");
      v85 = v25;
      -[SKUniform matrixFloat2x2Value](self, "matrixFloat2x2Value");
      objc_msgSend(v20, "stringWithFormat:", CFSTR("\n\t{%.3f, %.3f,\n \t%.3f, %.3f}"), *(_QWORD *)&v22, *(_QWORD *)&v24, v85, v26);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatMatrix2");
      break;
    case 6:
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v29 = v28;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v31 = v30;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v33 = v32;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v35 = v34;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v37 = v36;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v39 = v38;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v41 = v40;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      v87 = v42;
      -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
      objc_msgSend(v27, "stringWithFormat:", CFSTR("\n\t{%.3f, %.3f, %.3f,\n \t%.3f, %.3f %.3f,\n \t%.3f, %.3f %.3f}"), *(_QWORD *)&v29, *(_QWORD *)&v31, *(_QWORD *)&v33, *(_QWORD *)&v35, *(_QWORD *)&v37, *(_QWORD *)&v39, *(_QWORD *)&v41, v87, v43);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatMatrix3");
      break;
    case 7:
      v44 = (void *)MEMORY[0x1E0CB3940];
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v86 = v45;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v79 = v46;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v77 = v47;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v76 = v48;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v75 = v49;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v74 = v50;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v52 = v51;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v54 = v53;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v56 = v55;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v58 = v57;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v60 = v59;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v62 = v61;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v64 = v63;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v66 = v65;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      v73 = v67;
      -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
      objc_msgSend(v44, "stringWithFormat:", CFSTR("\n\t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,}"), *(_QWORD *)&v86, *(_QWORD *)&v79, *(_QWORD *)&v77, *(_QWORD *)&v76, *(_QWORD *)&v75, *(_QWORD *)&v74, *(_QWORD *)&v52, *(_QWORD *)&v54, *(_QWORD *)&v56, *(_QWORD *)&v58, *(_QWORD *)&v60, *(_QWORD *)&v62, *(_QWORD *)&v64, *(_QWORD *)&v66, v73, v68);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("FloatMatrix4");
      break;
    case 8:
      -[SKUniform textureValue](self, "textureValue");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        -[SKUniform textureValue](self, "textureValue");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "description");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = CFSTR("<nil>");
      }

      v6 = CFSTR("Texture");
      break;
    default:
      v7 = 0;
      v6 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SKUniform> type:'%@' value:%@"), v6, v7);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (SKUniform)initWithName:(NSString *)name
{
  NSString *v5;
  SKUniform *v6;
  SKUniform *v7;
  objc_super v9;

  v5 = name;
  v9.receiver = self;
  v9.super_class = (Class)SKUniform;
  v6 = -[SKUniform init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    -[SKUniform set_seed:](v6, "set_seed:", 1);
    objc_storeStrong((id *)&v7->_name, name);
  }

  return v7;
}

- (SKUniform)initWithName:(NSString *)name float:(float)value
{
  NSString *v6;
  SKUniform *v7;
  double v8;
  SKUniform *v9;

  v6 = name;
  v7 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v9 = v7;
  if (v7)
  {
    *(float *)&v8 = value;
    -[SKUniform setFloatValue:](v7, "setFloatValue:", v8);
  }

  return v9;
}

- (SKUniform)initWithName:(NSString *)name texture:(SKTexture *)texture
{
  NSString *v6;
  SKTexture *v7;
  SKUniform *v8;
  SKUniform *v9;

  v6 = name;
  v7 = texture;
  v8 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v9 = v8;
  if (v8)
    -[SKUniform setTextureValue:](v8, "setTextureValue:", v7);

  return v9;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat2:(vector_float2)value
{
  NSString *v6;
  SKUniform *v7;
  SKUniform *v8;

  v6 = name;
  v7 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v8 = v7;
  if (v7)
    -[SKUniform setVectorFloat2Value:](v7, "setVectorFloat2Value:", *(double *)&value);

  return v8;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat3:(vector_float3)value
{
  double v4;
  NSString *v6;
  SKUniform *v7;
  SKUniform *v8;
  double v10;

  v10 = v4;
  v6 = name;
  v7 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v8 = v7;
  if (v7)
    -[SKUniform setVectorFloat3Value:](v7, "setVectorFloat3Value:", v10);

  return v8;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat4:(vector_float4)value
{
  NSString *v5;
  SKUniform *v6;
  SKUniform *v7;
  double v9;

  v9 = *(double *)value.i64;
  v5 = name;
  v6 = -[SKUniform initWithName:](self, "initWithName:", v5);
  v7 = v6;
  if (v6)
    -[SKUniform setVectorFloat4Value:](v6, "setVectorFloat4Value:", v9);

  return v7;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value
{
  double v4;
  double v5;
  NSString *v7;
  SKUniform *v8;
  SKUniform *v9;

  v4 = *(double *)&value.columns[1];
  v5 = *(double *)value.columns;
  v7 = name;
  v8 = -[SKUniform initWithName:](self, "initWithName:", v7);
  v9 = v8;
  if (v8)
    -[SKUniform setMatrixFloat2x2Value:](v8, "setMatrixFloat2x2Value:", v5, v4);

  return v9;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value
{
  NSString *v5;
  SKUniform *v6;
  SKUniform *v7;
  double v9;
  double v10;
  double v11;

  v10 = *(double *)value.columns[1].i64;
  v11 = *(double *)value.columns[2].i64;
  v9 = *(double *)value.columns[0].i64;
  v5 = name;
  v6 = -[SKUniform initWithName:](self, "initWithName:", v5);
  v7 = v6;
  if (v6)
    -[SKUniform setMatrixFloat3x3Value:](v6, "setMatrixFloat3x3Value:", v9, v10, v11);

  return v7;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value
{
  NSString *v5;
  SKUniform *v6;
  SKUniform *v7;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = *(double *)value.columns[2].i64;
  v12 = *(double *)value.columns[3].i64;
  v9 = *(double *)value.columns[0].i64;
  v10 = *(double *)value.columns[1].i64;
  v5 = name;
  v6 = -[SKUniform initWithName:](self, "initWithName:", v5);
  v7 = v6;
  if (v6)
    -[SKUniform setMatrixFloat4x4Value:](v6, "setMatrixFloat4x4Value:", v9, v10, v11, v12);

  return v7;
}

- (SKUniform)initWithName:(NSString *)name floatVector2:(GLKVector2)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  NSString *v9;
  SKUniform *v10;
  double v11;
  double v12;
  SKUniform *v13;

  v6 = v5;
  v7 = v4;
  v9 = name;
  v10 = -[SKUniform initWithName:](self, "initWithName:", v9);
  v13 = v10;
  if (v10)
  {
    LODWORD(v11) = v7;
    LODWORD(v12) = v6;
    -[SKUniform setFloatVector2Value:](v10, "setFloatVector2Value:", v11, v12);
  }

  return v13;
}

- (SKUniform)initWithName:(NSString *)name floatVector3:(GLKVector3)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSString *v11;
  SKUniform *v12;
  double v13;
  double v14;
  double v15;
  SKUniform *v16;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v11 = name;
  v12 = -[SKUniform initWithName:](self, "initWithName:", v11);
  v16 = v12;
  if (v12)
  {
    LODWORD(v13) = v9;
    LODWORD(v14) = v8;
    LODWORD(v15) = v7;
    -[SKUniform setFloatVector3Value:](v12, "setFloatVector3Value:", v13, v14, v15);
  }

  return v16;
}

- (SKUniform)initWithName:(NSString *)name floatVector4:(GLKVector4)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSString *v13;
  SKUniform *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SKUniform *v19;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = name;
  v14 = -[SKUniform initWithName:](self, "initWithName:", v13);
  v19 = v14;
  if (v14)
  {
    LODWORD(v15) = v11;
    LODWORD(v16) = v10;
    LODWORD(v17) = v9;
    LODWORD(v18) = v8;
    -[SKUniform setFloatVector4Value:](v14, "setFloatVector4Value:", v15, v16, v17, v18);
  }

  return v19;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSString *v13;
  SKUniform *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SKUniform *v19;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = name;
  v14 = -[SKUniform initWithName:](self, "initWithName:", v13);
  v19 = v14;
  if (v14)
  {
    LODWORD(v15) = v11;
    LODWORD(v16) = v10;
    LODWORD(v17) = v9;
    LODWORD(v18) = v8;
    -[SKUniform setFloatMatrix2Value:](v14, "setFloatMatrix2Value:", v15, v16, v17, v18);
  }

  return v19;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value
{
  NSString *v6;
  SKUniform *v7;
  SKUniform *v8;
  __int128 v9;
  _OWORD v11[2];
  float m22;

  v6 = name;
  v7 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&value->m[4];
    v11[0] = *(_OWORD *)&value->m00;
    v11[1] = v9;
    m22 = value->m22;
    -[SKUniform setFloatMatrix3Value:](v7, "setFloatMatrix3Value:", v11);
  }

  return v8;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value
{
  NSString *v6;
  SKUniform *v7;
  SKUniform *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[4];

  v6 = name;
  v7 = -[SKUniform initWithName:](self, "initWithName:", v6);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&value->m[4];
    v12[0] = *(_OWORD *)&value->m00;
    v12[1] = v9;
    v10 = *(_OWORD *)&value->m[12];
    v12[2] = *(_OWORD *)&value->m[8];
    v12[3] = v10;
    -[SKUniform setFloatMatrix4Value:](v7, "setFloatMatrix4Value:", v12);
  }

  return v8;
}

+ (SKUniform)uniformWithName:(NSString *)name
{
  NSString *v3;
  void *v4;

  v3 = name;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:", v3);

  return (SKUniform *)v4;
}

+ (SKUniform)uniformWithName:(NSString *)name float:(float)value
{
  NSString *v5;
  id v6;
  double v7;
  void *v8;

  v5 = name;
  v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&v7 = value;
  v8 = (void *)objc_msgSend(v6, "initWithName:float:", v5, v7);

  return (SKUniform *)v8;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat2:(vector_float2)value
{
  NSString *v5;
  void *v6;

  v5 = name;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:vectorFloat2:", v5, *(double *)&value);

  return (SKUniform *)v6;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat3:(vector_float3)value
{
  double v4;
  NSString *v5;
  void *v6;
  double v8;

  v8 = v4;
  v5 = name;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:vectorFloat3:", v5, v8);

  return (SKUniform *)v6;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat4:(vector_float4)value
{
  NSString *v4;
  void *v5;
  double v7;

  v7 = *(double *)value.i64;
  v4 = name;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:vectorFloat4:", v4, v7);

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value
{
  double v4;
  double v5;
  NSString *v6;
  void *v7;

  v4 = *(double *)&value.columns[1];
  v5 = *(double *)value.columns;
  v6 = name;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat2x2:", v6, v5, v4);

  return (SKUniform *)v7;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value
{
  NSString *v4;
  void *v5;
  double v7;
  double v8;
  double v9;

  v8 = *(double *)value.columns[1].i64;
  v9 = *(double *)value.columns[2].i64;
  v7 = *(double *)value.columns[0].i64;
  v4 = name;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat3x3:", v4, v7, v8, v9);

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value
{
  NSString *v4;
  void *v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v10 = *(double *)value.columns[3].i64;
  v8 = *(double *)value.columns[1].i64;
  v9 = *(double *)value.columns[2].i64;
  v7 = *(double *)value.columns[0].i64;
  v4 = name;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat4x4:", v4, v7, v8, v9, v10);

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector2:(GLKVector2)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  NSString *v8;
  id v9;
  double v10;
  double v11;
  void *v12;

  v6 = v5;
  v7 = v4;
  v8 = name;
  v9 = objc_alloc((Class)objc_opt_class());
  LODWORD(v10) = v7;
  LODWORD(v11) = v6;
  v12 = (void *)objc_msgSend(v9, "initWithName:floatVector2:", v8, v10, v11);

  return (SKUniform *)v12;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector3:(GLKVector3)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSString *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = name;
  v11 = objc_alloc((Class)objc_opt_class());
  LODWORD(v12) = v9;
  LODWORD(v13) = v8;
  LODWORD(v14) = v7;
  v15 = (void *)objc_msgSend(v11, "initWithName:floatVector3:", v10, v12, v13, v14);

  return (SKUniform *)v15;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector4:(GLKVector4)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSString *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = name;
  v13 = objc_alloc((Class)objc_opt_class());
  LODWORD(v14) = v11;
  LODWORD(v15) = v10;
  LODWORD(v16) = v9;
  LODWORD(v17) = v8;
  v18 = (void *)objc_msgSend(v13, "initWithName:floatVector4:", v12, v14, v15, v16, v17);

  return (SKUniform *)v18;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSString *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = name;
  v13 = objc_alloc((Class)objc_opt_class());
  LODWORD(v14) = v11;
  LODWORD(v15) = v10;
  LODWORD(v16) = v9;
  LODWORD(v17) = v8;
  v18 = (void *)objc_msgSend(v13, "initWithName:floatMatrix2:", v12, v14, v15, v16, v17);

  return (SKUniform *)v18;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value
{
  NSString *v5;
  id v6;
  __int128 v7;
  void *v8;
  _OWORD v10[2];
  float m22;

  v5 = name;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = *(_OWORD *)&value->m[4];
  v10[0] = *(_OWORD *)&value->m00;
  v10[1] = v7;
  m22 = value->m22;
  v8 = (void *)objc_msgSend(v6, "initWithName:floatMatrix3:", v5, v10);

  return (SKUniform *)v8;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value
{
  NSString *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  _OWORD v11[4];

  v5 = name;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = *(_OWORD *)&value->m[4];
  v11[0] = *(_OWORD *)&value->m00;
  v11[1] = v7;
  v8 = *(_OWORD *)&value->m[12];
  v11[2] = *(_OWORD *)&value->m[8];
  v11[3] = v8;
  v9 = (void *)objc_msgSend(v6, "initWithName:floatMatrix4:", v5, v11);

  return (SKUniform *)v9;
}

+ (SKUniform)uniformWithName:(NSString *)name texture:(SKTexture *)texture
{
  NSString *v5;
  SKTexture *v6;
  void *v7;

  v5 = name;
  v6 = texture;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:texture:", v5, v6);

  return (SKUniform *)v7;
}

- (GLKVector2)floatVector2Value
{
  return (GLKVector2)-[SKUniform vectorFloat2Value](self, "vectorFloat2Value");
}

- (GLKVector3)floatVector3Value
{
  uint64_t v2;
  float v3;
  __int128 v4;
  uint64_t i;
  _QWORD v6[3];
  GLKVector3 result;

  v2 = -[SKUniform vectorFloat3Value](self, "vectorFloat3Value");
  for (i = 0; i != 3; ++i)
  {
    *(_OWORD *)v6 = v4;
    *((_DWORD *)&v6[2] + i + 1) = *(_DWORD *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
  }
  *(_QWORD *)&result.x = v2;
  result.z = v3;
  return result;
}

- (GLKVector4)floatVector4Value
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t i;
  _DWORD v6[5];
  GLKVector4 result;

  v2 = -[SKUniform vectorFloat4Value](self, "vectorFloat4Value");
  for (i = 0; i != 4; ++i)
  {
    *(_OWORD *)v6 = v4;
    v6[i + 4] = *(_DWORD *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
  }
  *(_QWORD *)&result.v[2] = v3;
  *(_QWORD *)&result.x = v2;
  return result;
}

- (GLKMatrix2)floatMatrix2Value
{
  uint64_t v2;
  uint64_t v3;
  GLKMatrix2 result;

  v2 = -[SKUniform matrixFloat2x2Value](self, "matrixFloat2x2Value");
  __break(1u);
  *(_QWORD *)&result.m[2] = v3;
  *(_QWORD *)&result.m00 = v2;
  return result;
}

- (GLKMatrix3)floatMatrix3Value
{
  __int128 v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  int i;
  _OWORD v9[3];

  -[SKUniform matrixFloat3x3Value](self, "matrixFloat3x3Value");
  v5 = 0;
  v9[0] = v4;
  v9[1] = v6;
  v9[2] = v7;
  for (i = 1; ; ++i)
  {
    *((_DWORD *)&retstr->m00 + v5) = v4;
    v4 = v9[i];
    v5 += 3;
  }
}

- (GLKMatrix4)floatMatrix4Value
{
  __int128 v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int i;
  _OWORD v10[4];

  -[SKUniform matrixFloat4x4Value](self, "matrixFloat4x4Value");
  v5 = 0;
  v10[0] = v4;
  v10[1] = v6;
  v10[2] = v7;
  v10[3] = v8;
  for (i = 1; ; ++i)
  {
    *((_DWORD *)&retstr->m00 + v5) = v4;
    v4 = v10[i];
    v5 += 4;
  }
}

- (void)setFloatVector2Value:(GLKVector2)floatVector2Value
{
  int v3;
  int v4;
  uint64_t v5;
  double v6;
  char v7;
  char v8;
  int v9;
  double v10;
  int v11;
  int v12;

  v5 = 0;
  v11 = v3;
  v12 = v4;
  v6 = 0.0;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = *(&v11 + v5);
    v10 = v6;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v5 & 1))) = v9;
    v6 = v10;
    v5 = 1;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  -[SKUniform setVectorFloat2Value:](self, "setVectorFloat2Value:", *(_QWORD *)&floatVector2Value, v10);
}

- (void)setFloatVector3Value:(GLKVector3)floatVector3Value
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int128 v9;
  __int128 v10;
  int v11;
  int v12;
  int v13;

  v6 = 0;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v7 = 0uLL;
  do
  {
    v8 = *(&v11 + v6);
    v10 = v7;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v8;
    v9 = v10;
    HIDWORD(v9) = HIDWORD(v7);
    ++v6;
    v7 = v9;
  }
  while (v6 != 3);
  -[SKUniform setVectorFloat3Value:](self, "setVectorFloat3Value:", *(_QWORD *)&floatVector3Value.x, *(_QWORD *)&floatVector3Value.v[2]);
}

- (void)setFloatVector4Value:(GLKVector4)floatVector4Value
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  __int128 v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v7 = 0;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v8 = 0uLL;
  do
  {
    v9 = *(&v11 + v7);
    v10 = v8;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v9;
    v8 = v10;
    ++v7;
  }
  while (v7 != 4);
  -[SKUniform setVectorFloat4Value:](self, "setVectorFloat4Value:", *(_QWORD *)&floatVector4Value.x, *(_QWORD *)&floatVector4Value.v[2], *(double *)&v10);
}

- (vector_float2)vectorFloat2Value
{
  vector_float2 result;

  if (self->_type)
  {
    return *(vector_float2 *)&self->_value._floatValue;
  }
  else
  {
    self->_type = 2;
    result = 0;
    *(_QWORD *)&self->_value._floatValue = 0;
  }
  return result;
}

- (vector_float3)vectorFloat3Value
{
  vector_float3 result;

  if (!self->_type)
  {
    self->_type = 3;
    *(_OWORD *)&self->_value._floatValue = 0u;
  }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (vector_float4)vectorFloat4Value
{
  vector_float4 result;

  if (self->_type)
  {
    return *(vector_float4 *)&self->_value._floatValue;
  }
  else
  {
    self->_type = 4;
    result = 0uLL;
    *(_OWORD *)&self->_value._floatValue = 0u;
  }
  return result;
}

- (matrix_float2x2)matrixFloat2x2Value
{
  simd_float2 v2;
  Class isa;
  matrix_float2x2 result;

  if (!self->_type)
  {
    self->_type = 5;
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x1E0C83FE0];
  }
  v2 = *(simd_float2 *)&self->_value._floatValue;
  isa = self[1].super.isa;
  result.columns[1] = (simd_float2)isa;
  result.columns[0] = v2;
  return result;
}

- (matrix_float3x3)matrixFloat3x3Value
{
  uint64_t v2;
  __int128 v3;
  simd_float3 v4;
  simd_float3 v5;
  simd_float3 v6;
  matrix_float3x3 result;

  if (!self->_type)
  {
    self->_type = 6;
    v2 = MEMORY[0x1E0C83FE8];
    v3 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&self[1]._type = v3;
    *(_OWORD *)&self[1]._seed = *(_OWORD *)(v2 + 32);
  }
  v4 = *(simd_float3 *)&self->_value._floatValue;
  v5 = *(simd_float3 *)&self[1]._type;
  v6 = *(simd_float3 *)&self[1]._seed;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

- (matrix_float4x4)matrixFloat4x4Value
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  simd_float4 v8;
  matrix_float4x4 result;

  if (!self->_type)
  {
    self->_type = 7;
    v2 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v3 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&self[1]._type = v2;
    *(_OWORD *)&self[1]._seed = v4;
    *(_OWORD *)&self[1]._targetShaders = v3;
  }
  v5 = *(simd_float4 *)&self->_value._floatValue;
  v6 = *(simd_float4 *)&self[1]._type;
  v7 = *(simd_float4 *)&self[1]._seed;
  v8 = *(simd_float4 *)&self[1]._targetShaders;
  result.columns[3] = v8;
  result.columns[2] = v7;
  result.columns[1] = v6;
  result.columns[0] = v5;
  return result;
}

- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value
{
  if (!self->_type)
    self->_type = 2;
  *(vector_float2 *)&self->_value._floatValue = vectorFloat2Value;
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value
{
  __int128 v3;

  if (!self->_type)
    self->_type = 3;
  *(_OWORD *)&self->_value._floatValue = v3;
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed", vectorFloat3Value.i64[0], vectorFloat3Value.i64[1]) + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value
{
  if (!self->_type)
    self->_type = 4;
  *(vector_float4 *)&self->_value._floatValue = vectorFloat4Value;
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setMatrixFloat2x2Value:(matrix_float2x2)matrixFloat2x2Value
{
  if (!self->_type)
    self->_type = 5;
  *(simd_float2 *)&self->_value._floatValue = matrixFloat2x2Value.columns[0];
  self[1].super.isa = (Class)matrixFloat2x2Value.columns[1];
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setMatrixFloat3x3Value:(matrix_float3x3)matrixFloat3x3Value
{
  if (!self->_type)
    self->_type = 6;
  *(simd_float3 *)&self->_value._floatValue = matrixFloat3x3Value.columns[0];
  *(simd_float3 *)&self[1]._type = matrixFloat3x3Value.columns[1];
  *(simd_float3 *)&self[1]._seed = matrixFloat3x3Value.columns[2];
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setMatrixFloat4x4Value:(matrix_float4x4)matrixFloat4x4Value
{
  if (!self->_type)
    self->_type = 7;
  *(simd_float4 *)&self->_value._floatValue = matrixFloat4x4Value.columns[0];
  *(simd_float4 *)&self[1]._type = matrixFloat4x4Value.columns[1];
  *(simd_float4 *)&self[1]._seed = matrixFloat4x4Value.columns[2];
  *(simd_float4 *)&self[1]._targetShaders = matrixFloat4x4Value.columns[3];
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (void)setTextureValue:(SKTexture *)textureValue
{
  SKTexture *v4;
  SKTexture *v5;
  SKTexture *v6;

  v4 = textureValue;
  if (!self->_type)
  {
    self->_type = 8;
    v5 = self->_textureValue;
    self->_textureValue = 0;

  }
  v6 = self->_textureValue;
  self->_textureValue = v4;

  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (SKTexture)textureValue
{
  SKTexture *textureValue;

  if (!self->_type)
  {
    self->_type = 8;
    textureValue = self->_textureValue;
    self->_textureValue = 0;

  }
  return self->_textureValue;
}

- (void)setFloatValue:(float)floatValue
{
  SKTexture *textureValue;

  if (!self->_type)
  {
    self->_type = 1;
    textureValue = self->_textureValue;
    self->_textureValue = 0;

  }
  self->_value._floatValue = floatValue;
  -[SKUniform set_seed:](self, "set_seed:", -[SKUniform _seed](self, "_seed") + 1);
  -[SKUniform _propagateChange](self, "_propagateChange");
}

- (float)floatValue
{
  if (self->_type)
    return self->_value._floatValue;
  self->_type = 1;
  self->_value._floatValue = 0.0;
  return 0.0;
}

- (SKUniformType)uniformType
{
  return self->_type;
}

- (SKUniform)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  __int128 v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  void *v42;
  int v43;
  SKTexture *v44;
  SKTexture *textureValue;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t i;
  uint64_t j;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t k;
  uint64_t m;
  void *v70;
  int v71;
  unsigned int v73;
  int v74;
  unsigned int v75;
  __int128 v76;
  unsigned int v77;
  unsigned int v78;
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[5];

  v84[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUniform set_seed:](self, "set_seed:", 0);
  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  switch(self->_type)
  {
    case 1:
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_floatValue"));
      self->_value._floatValue = v7;
      break;
    case 2:
      v46 = (void *)MEMORY[0x1E0C99E60];
      v84[0] = objc_opt_class();
      v84[1] = objc_opt_class();
      v84[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setWithArray:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("_floatVector2Value"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      v78 = v51;
      objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "floatValue");
      *(_QWORD *)&self->_value._floatValue = __PAIR64__(v53, v78);

      break;
    case 3:
      v8 = (void *)MEMORY[0x1E0C99E60];
      v83[0] = objc_opt_class();
      v83[1] = objc_opt_class();
      v83[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_floatVector3Value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      *(_QWORD *)&v76 = v13;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v74 = v15;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v17 = v76;
      DWORD1(v17) = v74;
      DWORD2(v17) = v18;
      *(_OWORD *)&self->_value._floatValue = v17;

      break;
    case 4:
      v19 = (void *)MEMORY[0x1E0C99E60];
      v82[0] = objc_opt_class();
      v82[1] = objc_opt_class();
      v82[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_floatVector3Value"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v77 = v24;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      v75 = v26;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v73 = v28;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      *(_QWORD *)&v30 = __PAIR64__(v75, v77);
      *((_QWORD *)&v30 + 1) = __PAIR64__(v31, v73);
      *(_OWORD *)&self->_value._floatValue = v30;

      break;
    case 5:
      v32 = (void *)MEMORY[0x1E0C99E60];
      v81[0] = objc_opt_class();
      v81[1] = objc_opt_class();
      v81[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("_floatMatrix2Value"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0;
      v37 = 1;
      do
      {
        v38 = 0;
        v39 = v37;
        v40 = 1;
        do
        {
          v41 = v40;
          objc_msgSend(v35, "objectAtIndexedSubscript:", v38 | (2 * v36));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "floatValue");
          *((_DWORD *)&self->_value._floatValue + 2 * v36 + v38) = v43;

          v40 = 0;
          v38 = 1;
        }
        while ((v41 & 1) != 0);
        v37 = 0;
        v36 = 1;
      }
      while ((v39 & 1) != 0);

      break;
    case 6:
      v54 = (void *)MEMORY[0x1E0C99E60];
      v80[0] = objc_opt_class();
      v80[1] = objc_opt_class();
      v80[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setWithArray:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("_floatMatrix3Value"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = 0;
      for (i = 0; i != 3; ++i)
      {
        for (j = 0; j != 3; ++j)
        {
          objc_msgSend(v57, "objectAtIndexedSubscript:", v58 + j);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "floatValue");
          *((_DWORD *)&self->_value._floatValue + 4 * i + j) = v62;

        }
        v58 += 3;
      }

      break;
    case 7:
      v63 = (void *)MEMORY[0x1E0C99E60];
      v79[0] = objc_opt_class();
      v79[1] = objc_opt_class();
      v79[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setWithArray:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v65, CFSTR("_floatMatrix4Value"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 0;
      for (k = 0; k != 4; ++k)
      {
        for (m = 0; m != 4; ++m)
        {
          objc_msgSend(v66, "objectAtIndexedSubscript:", v67 + m);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "floatValue");
          *((_DWORD *)&self->_value._floatValue + 4 * k + m) = v71;

        }
        v67 += 4;
      }

      break;
    case 8:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textureValue"));
      v44 = (SKTexture *)objc_claimAutoreleasedReturnValue();
      textureValue = self->_textureValue;
      self->_textureValue = v44;

      break;
    default:
      break;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  $18B7F43D72E994E2264E153CDDB60386 *p_value;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  void *v33;
  double v34;
  uint64_t v35;
  $18B7F43D72E994E2264E153CDDB60386 *v36;
  int i;
  void *v38;
  double v39;
  uint64_t v40;
  $18B7F43D72E994E2264E153CDDB60386 *v41;
  int j;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  switch(self->_type)
  {
    case 1:
      *(float *)&v5 = self->_value._floatValue;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_floatValue"), v5);
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&self->_value._floatValue);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v6;
      LODWORD(v7) = *((_DWORD *)&self->_value + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_floatVector2Value"));

      break;
    case 3:
      *(float *)&v5 = self->_value._floatValue;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v10;
      LODWORD(v11) = *((_DWORD *)&self->_value + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v12;
      LODWORD(v13) = self[1].super.isa;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_floatVector3Value"));

      break;
    case 4:
      *(float *)&v5 = self->_value._floatValue;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v16;
      LODWORD(v17) = *((_DWORD *)&self->_value + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v18;
      LODWORD(v19) = self[1].super.isa;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v20;
      LODWORD(v21) = HIDWORD(self[1].super.isa);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("_floatVector4Value"));

      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      p_value = &self->_value;
      v28 = 1;
      do
      {
        v29 = 0;
        v30 = v28;
        v31 = 1;
        do
        {
          v32 = v31;
          LODWORD(v25) = p_value[2 * v26 + (v29 & 1)];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v33);

          v31 = 0;
          v29 = 1;
        }
        while ((v32 & 1) != 0);
        v28 = 0;
        v26 = 1;
      }
      while ((v30 & 1) != 0);
      objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("_floatMatrix2Value"));
      goto LABEL_21;
    case 6:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = &self->_value;
      do
      {
        for (i = 0; i != 3; ++i)
        {
          LODWORD(v34) = v36[4 * v35 + (i & 3)];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v38);

        }
        ++v35;
      }
      while (v35 != 3);
      objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("_floatMatrix3Value"));
      goto LABEL_21;
    case 7:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v41 = &self->_value;
      do
      {
        for (j = 0; j != 4; ++j)
        {
          LODWORD(v39) = v41[4 * v40 + (j & 3)];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v43);

        }
        ++v40;
      }
      while (v40 != 4);
      objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("_floatMatrix4Value"));
LABEL_21:

      break;
    case 8:
      objc_msgSend(v4, "encodeObject:forKey:", self->_textureValue, CFSTR("_textureValue"));
      break;
    default:
      break;
  }

}

- (BOOL)isEqualToUniform:(id)a3
{
  SKUniform *v4;
  int64_t type;
  float v6;
  float32x2_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  float v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  float v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  float v28;
  BOOL v29;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v4 = (SKUniform *)a3;
  if (self == v4)
  {
LABEL_36:
    v29 = 1;
  }
  else
  {
    if (-[NSString isEqualToString:](self->_name, "isEqualToString:", v4->_name))
    {
      type = self->_type;
      if (type == v4->_type)
      {
        switch(type)
        {
          case 1:
            v6 = self->_value._floatValue - v4->_value._floatValue;
            goto LABEL_15;
          case 2:
            v7 = vsub_f32(*(float32x2_t *)&self->_value._floatValue, *(float32x2_t *)&v4->_value._floatValue);
            if ((v7.i32[0] & 0x60000000) != 0)
              goto LABEL_37;
            v6 = v7.f32[1];
            goto LABEL_15;
          case 3:
            v8 = vsubq_f32(*(float32x4_t *)&self->_value._floatValue, *(float32x4_t *)&v4->_value._floatValue);
            if ((v8.i32[0] & 0x60000000) != 0 || (v8.i32[1] & 0x60000000) != 0)
              goto LABEL_37;
            v6 = v8.f32[2];
            goto LABEL_15;
          case 4:
            v9 = vsubq_f32(*(float32x4_t *)&self->_value._floatValue, *(float32x4_t *)&v4->_value._floatValue);
            if ((v9.i32[0] & 0x60000000) != 0 || (v9.i32[1] & 0x60000000) != 0 || (v9.i32[2] & 0x60000000) != 0)
              goto LABEL_37;
            v6 = v9.f32[3];
LABEL_15:
            if ((LODWORD(v6) & 0x60000000) == 0)
              goto LABEL_36;
            goto LABEL_37;
          case 5:
            v10 = 0;
            v11 = 1;
LABEL_18:
            v12 = 0;
            v13 = v11;
            v14 = *((_QWORD *)&v4->_value._floatValue + v10);
            v15 = *((_QWORD *)&self->_value._floatValue + v10);
            v16 = 1;
            while (1)
            {
              v17 = v16;
              v32 = v14;
              v18 = *(float *)((unint64_t)&v32 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v12 & 1)));
              v31 = v15;
              if ((COERCE_UNSIGNED_INT(v18 - *(float *)((unint64_t)&v31 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v12 & 1)))) & 0x60000000) != 0)
                goto LABEL_37;
              v16 = 0;
              v12 = 1;
              if ((v17 & 1) == 0)
              {
                v11 = 0;
                v10 = 1;
                if ((v13 & 1) != 0)
                  goto LABEL_18;
                goto LABEL_36;
              }
            }
          case 6:
            v19 = 0;
LABEL_24:
            v20 = 0;
            v21 = *((_OWORD *)&v4->_value._floatValue + v19);
            v22 = *((_OWORD *)&self->_value._floatValue + v19);
            while (1)
            {
              v34 = v21;
              v23 = *(float *)((unint64_t)&v34 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
              v33 = v22;
              if ((COERCE_UNSIGNED_INT(v23 - *(float *)((unint64_t)&v33 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)))) & 0x60000000) != 0)
                goto LABEL_37;
              if (++v20 == 3)
              {
                if (++v19 != 3)
                  goto LABEL_24;
                goto LABEL_36;
              }
            }
          case 7:
            v24 = 0;
            break;
          case 8:
            if (-[SKTexture isEqualToTexture:](self->_textureValue, "isEqualToTexture:", v4->_textureValue))
              goto LABEL_36;
            goto LABEL_37;
          default:
            goto LABEL_36;
        }
LABEL_30:
        v25 = 0;
        v26 = *((_OWORD *)&v4->_value._floatValue + v24);
        v27 = *((_OWORD *)&self->_value._floatValue + v24);
        while (1)
        {
          v36 = v26;
          v28 = *(float *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3 | (4 * (v25 & 3)));
          v35 = v27;
          if ((COERCE_UNSIGNED_INT(v28 - *(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v25 & 3)))) & 0x60000000) != 0)
            break;
          if (++v25 == 4)
          {
            if (++v24 != 4)
              goto LABEL_30;
            goto LABEL_36;
          }
        }
      }
    }
LABEL_37:
    v29 = 0;
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKUniform *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  NSString *name;

  v4 = objc_alloc_init(SKUniform);
  v4->_type = self->_type;
  v5 = *(_OWORD *)&self->_value._floatValue;
  v6 = *(_OWORD *)&self[1]._type;
  v7 = *(_OWORD *)&self[1]._targetShaders;
  *(_OWORD *)&v4[1]._seed = *(_OWORD *)&self[1]._seed;
  *(_OWORD *)&v4[1]._targetShaders = v7;
  *(_OWORD *)&v4->_value._floatValue = v5;
  *(_OWORD *)&v4[1]._type = v6;
  objc_storeStrong((id *)&v4->_textureValue, self->_textureValue);
  -[SKUniform name](self, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  name = v4->_name;
  v4->_name = (NSString *)v8;

  return v4;
}

- (void)_propagateChange
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_targetShaders;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "targetShader", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setUniformsDirty");

        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_addTargetShader:(id)a3
{
  id v4;
  NSMutableArray *targetShaders;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  targetShaders = self->_targetShaders;
  if (!targetShaders)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetShaders;
    self->_targetShaders = v6;

    targetShaders = self->_targetShaders;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = targetShaders;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "targetShader", (_QWORD)v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 == v4;

      if (v13)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    v8 = (NSMutableArray *)objc_opt_new();
    -[NSMutableArray setTargetShader:](v8, "setTargetShader:", v4);
    -[NSMutableArray addObject:](self->_targetShaders, "addObject:", v8);
  }

}

- (void)_removeTargetShader:(id)a3
{
  id v4;
  NSMutableArray *targetShaders;
  id v6;
  _QWORD v7[4];
  id v8;
  SKUniform *v9;

  v4 = a3;
  targetShaders = self->_targetShaders;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SKUniform__removeTargetShader___block_invoke;
  v7[3] = &unk_1EA4FFBD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](targetShaders, "enumerateObjectsUsingBlock:", v7);

}

void __33__SKUniform__removeTargetShader___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "targetShader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectAtIndex:", a3);
    *a4 = 1;
  }

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)_seed
{
  return self->_seed;
}

- (void)set_seed:(unint64_t)a3
{
  self->_seed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetShaders, 0);
  objc_storeStrong((id *)&self->_textureValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
