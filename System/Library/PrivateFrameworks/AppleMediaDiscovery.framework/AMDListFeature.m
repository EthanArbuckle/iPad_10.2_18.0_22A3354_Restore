@implementation AMDListFeature

- (AMDListFeature)initWithValue:(id)a3
{
  AMDListFeature *v3;
  AMDListFeature *v5;
  objc_super v6;
  id location[2];
  AMDListFeature *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDListFeature;
  v8 = -[AMDFeature initWithValue:](&v6, sel_initWithValue_, location[0]);
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (unint64_t)getCount
{
  unint64_t v3;
  id v4;
  char v5;
  id v6;

  v4 = -[AMDFeature _value](self, "_value");
  v5 = 0;
  if (v4)
  {
    v6 = -[AMDFeature _value](self, "_value");
    v5 = 1;
    v3 = objc_msgSend(v6, "count");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id location;
  int v15;
  int *v16;
  int v17;
  SEL v18;
  AMDListFeature *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v13 = 0;
  objc_storeStrong(&v13, a7);
  v12 = 0;
  objc_storeStrong(&v12, a8);
  v10 = v17;
  v11 = -[AMDFeature _value](v19, "_value");
  +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v10);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  double v8;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  id location;
  float v16;
  float *v17;
  int v18;
  SEL v19;
  AMDListFeature *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v14 = 0;
  objc_storeStrong(&v14, a7);
  v13 = 0;
  objc_storeStrong(&v13, a8);
  v11 = v18;
  v12 = -[AMDFeature _value](v20, "_value");
  *(float *)&v8 = v16;
  +[AMDFeature copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v11, v8);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id location;
  double v15;
  double *v16;
  int v17;
  SEL v18;
  AMDListFeature *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v13 = 0;
  objc_storeStrong(&v13, a7);
  v12 = 0;
  objc_storeStrong(&v12, a8);
  v10 = v17;
  v11 = -[AMDFeature _value](v19, "_value");
  +[AMDFeature copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v10, v15);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

@end
