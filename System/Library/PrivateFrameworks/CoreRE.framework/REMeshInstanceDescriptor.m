@implementation REMeshInstanceDescriptor

- (REMeshInstanceDescriptor)initWithMeshAssetInstance:(const void *)a3
{
  void *v5;
  REMeshInstanceDescriptor *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)a3 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMeshInstanceDescriptor initWithName:modelIndex:transform:lodSelectOptions:](self, "initWithName:modelIndex:transform:lodSelectOptions:", v5, *((unsigned int *)a3 + 20), *(_QWORD *)((char *)a3 + 84), *((double *)a3 + 2), *((double *)a3 + 4), *((double *)a3 + 6), *((double *)a3 + 8));

  return v6;
}

- (MeshInstance)meshInstanceWithModels:(SEL)a3 meshManager:(const void *)a4
{
  _anonymous_namespace_ *v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  REMeshLodSelectOptions v18;
  char *v19;
  MeshInstance *result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[REMeshInstanceDescriptor name](self, "name");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (_anonymous_namespace_ *)objc_msgSend(v25, "UTF8String");
  v26 = 0;
  v27 = (char *)&str_110;
  v10 = -[REMeshInstanceDescriptor modelIndex](self, "modelIndex");
  v11 = v10;
  v12 = *((_QWORD *)a4 + 7);
  if (v12 <= v10)
  {
    v28 = 0;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v29 = 136315906;
    v30 = "operator[]";
    v31 = 1024;
    v32 = 797;
    v33 = 2048;
    v34 = v11;
    v35 = 2048;
    v36 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  v13 = *(_QWORD *)(*((_QWORD *)a4 + 9) + 8 * v10);
  -[REMeshInstanceDescriptor transform](self, "transform");
  v23 = v15;
  v24 = v14;
  v21 = v17;
  v22 = v16;
  v18 = -[REMeshInstanceDescriptor lodSelectOptions](self, "lodSelectOptions");
  v19 = v27;
  *(_QWORD *)&retstr->var0.var0 = v26;
  retstr->var0.var1 = v19;
  v26 = 0;
  v27 = (char *)&str_110;
  *(_OWORD *)&retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var4.var2 = 0u;
  *(_OWORD *)&retstr->var5.var1 = 0u;
  re::DataArray<re::MeshModel>::tryGet((uint64_t)a5 + 8, v13);
  *(_OWORD *)&retstr->var3.var0.var0.var0 = v24;
  *(_OWORD *)&retstr->var3.var0.var5[4] = v23;
  *(_OWORD *)&retstr->var3.var0.var5[8] = v22;
  *(_OWORD *)&retstr->var3.var0.var5[12] = v21;
  retstr->var1 = (DataArrayHandle<re::MeshModel>)v13;
  retstr->var2 = v18.options;
  re::StringID::destroyString((re::StringID *)&v26);

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshInstanceDescriptor)initWithName:(__n128)a3 modelIndex:(__n128)a4 transform:(__n128)a5 lodSelectOptions:(uint64_t)a6
{
  id v12;
  REMeshInstanceDescriptor *v13;
  uint64_t v14;
  NSString *name;
  objc_super v21;

  v12 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)REMeshInstanceDescriptor;
  v13 = -[REMeshInstanceDescriptor init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_modelIndex = a8;
    *(__n128 *)&v13[1].super.isa = a2;
    *(__n128 *)&v13[1]._name = a3;
    *(__n128 *)&v13[2].super.isa = a4;
    *(__n128 *)&v13[2]._name = a5;
    v13->_lodSelectOptions = a9;
  }

  return v13;
}

- (REMeshInstanceDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  unint64_t v7;
  id v8;
  int32x4_t *v9;
  int32x4_t v10;
  int32x4_t v11;
  _BOOL4 v12;
  char v13;
  int32x4_t v14;
  int32x4_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  float32x4_t v21;
  NSString *v22;
  float v23;
  void *v24;
  char v26;
  REMeshInstanceDescriptor *v27;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modelIndex"));
  self->_modelIndex = v7;
  v29 = 0;
  v8 = objc_retainAutorelease(v4);
  v9 = (int32x4_t *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("transform"), &v29);
  if (v29 == 64)
  {
    v10 = *v9;
    v11 = v9[1];
    if ((v9->u32[0] & 0x7FFFFFFF) > 0x7F7FFFFF || (v10.i32[1] & 0x7FFFFFFFu) > 0x7F7FFFFF)
      v12 = 0;
    else
      v12 = (v10.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v10.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    v15 = v9[2];
    v14 = v9[3];
    if ((v11.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF || (v11.i32[1] & 0x7FFFFFFFu) > 0x7F7FFFFF)
      v16 = 0;
    else
      v16 = (v11.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v11.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    if ((v15.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF)
    {
      v18 = 0;
    }
    else
    {
      v17 = (v15.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v15.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
      v18 = (v15.i32[1] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v17;
    }
    if ((v14.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF)
    {
      v20 = 0;
    }
    else
    {
      v19 = (v14.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v14.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
      v20 = (v14.i32[1] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v19;
    }
    v21.i64[0] = vuzp2q_s32(vuzp2q_s32(v11, v10), v11).u64[0];
    v21.i64[1] = __PAIR64__(v14.u32[3], v15.u32[3]);
    *(int16x4_t *)v21.f32 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v21, (float32x4_t)xmmword_2260E5D70)));
    v21.i16[0] = vmaxv_u16(*(uint16x4_t *)v21.f32);
    if ((v20 & ~v21.i32[0] & (v12 && v16 && v18)) == 1)
    {
      *(int32x4_t *)&self[1].super.isa = v10;
      *(int32x4_t *)&self[1]._name = v11;
      v13 = 1;
      *(int32x4_t *)&self[2].super.isa = v15;
      *(int32x4_t *)&self[2]._name = v14;
    }
    else
    {
      v13 = 0;
      *(_OWORD *)&self[2].super.isa = 0u;
      *(_OWORD *)&self[2]._name = 0u;
      *(_OWORD *)&self[1].super.isa = 0u;
      *(_OWORD *)&self[1]._name = 0u;
    }
  }
  else
  {
    v13 = 0;
  }
  self->_lodSelectOptions.options.strategy = objc_msgSend(v8, "decodeIntForKey:", CFSTR("lodSelectOptions.strategy"));
  objc_msgSend(v8, "decodeFloatForKey:", CFSTR("lodSelectOptions.bias"));
  self->_lodSelectOptions.options.bias = v23;
  if (HIDWORD(v7))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failWithError:", v24);
LABEL_45:

    v27 = 0;
    goto LABEL_46;
  }
  if (v23 < 0.00001 || self->_lodSelectOptions.options.strategy >= 2u)
    v26 = 0;
  else
    v26 = v13;
  if ((v26 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failWithError:", v24);
    goto LABEL_45;
  }
  v27 = self;
LABEL_46:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_modelIndex, CFSTR("modelIndex"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self[1], 64, CFSTR("transform"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_lodSelectOptions.options.strategy, CFSTR("lodSelectOptions.strategy"));
  *(float *)&v4 = self->_lodSelectOptions.options.bias;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("lodSelectOptions.bias"), v4);

}

- (BOOL)validateWithModelCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t modelIndex;

  modelIndex = self->_modelIndex;
  if (modelIndex >= a3)
  return modelIndex < a3;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  NSString *name;
  objc_class *v6;
  size_t v7;
  NSString *v8;

  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  name = self->_name;
  if (name)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = class_getInstanceSize(v6);
    v8 = self->_name;
    if (v8)
      name = (NSString *)(-[NSString lengthOfBytesUsingEncoding:](v8, "lengthOfBytesUsingEncoding:", 4) + 1);
    else
      name = 0;
  }
  else
  {
    v7 = 0;
  }
  return (unint64_t)name + v7 + InstanceSize;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)modelIndex
{
  return self->_modelIndex;
}

- (__n128)transform
{
  return a1[2];
}

- (REMeshLodSelectOptions)lodSelectOptions
{
  return self->_lodSelectOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 24) = 0;
  *((_DWORD *)self + 7) = 1065353216;
  return self;
}

@end
