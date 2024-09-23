@implementation CAPresentationModifier

- (void)setValue:(id)a3 velocity:(id)a4
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifier"), CFSTR("%@: value can't be nil"), self);
  if (self->_value != a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_l);

    self->_value = a3;
    self->_velocity = a4;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_l);
    -[CAPresentationModifier write](self, "write");
    if (BYTE9(xmmword_1ECDC6A90))
      kdebug_trace();
  }
}

- (Object)CA_copyRenderValue
{
  CAPresentationModifierGroup *group;
  uint64_t v4;
  uint64_t v5;
  _QWORD *impl;
  uint64_t v7;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  Object *result;
  Atomic *p_var1;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;

  group = self->_group;
  if (group)
  {
    v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 40);
      if (v5)
      {
        if (*(_QWORD *)(v5 + 208))
          -[CAPresentationModifierGroup _setLocalContextId:](group, "_setLocalContextId:", (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)(v5 + 216) + 16))(v5 + 216, a2));
      }
    }
    impl = self->_impl;
    v7 = -[CAPresentationModifierGroup shmem](group, "shmem");
    v8 = (unsigned int *)impl[2];
    if (v8 != (unsigned int *)v7)
    {
      if (v8)
      {
        v9 = v8 + 2;
        do
        {
          v10 = __ldaxr(v9);
          v11 = v10 - 1;
        }
        while (__stlxr(v11, v9));
        if (!v11)
          (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 16))(v8);
      }
      if (v7)
      {
        v12 = (unsigned int *)(v7 + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 + 1, v12));
        if (!v13)
        {
          v7 = 0;
          do
            v18 = __ldaxr(v12);
          while (__stlxr(v18 - 1, v12));
        }
      }
      impl[2] = v7;
    }
  }
  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v16 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v16 + 1, (unsigned int *)p_var1));
    if (!v16)
    {
      result = 0;
      do
        v17 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v17 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 initialVelocity:(id)a5 additive:(BOOL)a6 preferredFrameRateRangeMaximum:(int)a7 group:(id)a8
{
  _BOOL4 v10;
  CAPresentationModifier *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  _DWORD *v24;
  _BOOL4 v25;
  int v26;
  int v27;
  int v28;
  _BOOL4 v29;
  CA::Render::Shmem *v30;
  _DWORD *v31;
  uint64_t v32;
  malloc_zone_t *malloc_zone;
  CA::Render **v34;
  const __CFString *v35;
  CA::Render **v36;
  void **v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  BOOL v44;
  int v45;
  int v46;
  unsigned int v48;
  id v49;
  int v50;
  unint64_t v51;
  objc_super v52;
  uint64_t v53;

  v10 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)CAPresentationModifier;
  v14 = -[CAPresentationModifier init](&v52, sel_init);
  if (!v14)
    return v14;
  v15 = objc_msgSend(a4, "CA_numericValueCount");
  v16 = (16 * v15) | 8;
  if ((unint64_t)(v15 - 0x1000000000000000) < 0xF000000000000001)
    v16 = 0;
  if (is_mul_ok(v16, 3uLL))
    v17 = 3 * v16;
  else
    v17 = 0;
  if ((unint64_t)(v15 - 0x1000000000000000) < 0xF000000000000001 || !v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifier"), CFSTR("%@: too large count (%zu) for value (%@)"), v14, v15, a4);
    goto LABEL_51;
  }
  if (a8)
  {
    v18 = objc_msgSend(a8, "nextSlotWithPayloadSize:");
    v19 = objc_msgSend(a8, "shmem");
    v20 = (_DWORD *)v19;
    if (v19)
    {
      v21 = (unsigned int *)(v19 + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 + 1, v21));
      if (!v22)
      {
        v20 = 0;
        do
          v48 = __ldaxr(v21);
        while (__stlxr(v48 - 1, v21));
      }
    }
    v49 = a5;
    v23 = *((_QWORD *)v20 + 3) + *((_QWORD *)v20 + 2);
    v24 = (_DWORD *)(v23 - 8 * v18);
    *(v24 - 2) = v15;
    v50 = a7;
    if (v18)
    {
      v25 = v10;
      v26 = *(_DWORD *)(v23 - 8 * v18 + 4);
      if (*v24)
        v27 = 48 * *v24 + 24;
      else
        v27 = 0;
      v28 = v26 + v27;
    }
    else
    {
      v25 = v10;
      v28 = 0;
    }
  }
  else
  {
    v29 = v17 >= 0xFFFFFFFFFFFFFFF8;
    if (v17 + 8 >= 0xFFFFFFFFFFFFFFD8)
      v29 = 1;
    if (v29)
      v30 = 0;
    else
      v30 = (CA::Render::Shmem *)(v17 + 48);
    v31 = CA::Render::Shmem::new_shmem(v30);
    if (!v31)
      goto LABEL_51;
    v20 = v31;
    v49 = a5;
    v25 = v10;
    v50 = a7;
    v28 = 0;
    v18 = 0;
    v32 = *((_QWORD *)v31 + 3);
    *(_DWORD *)(v32 + 12) = 1;
    v24 = (_DWORD *)(v32 + *((_QWORD *)v31 + 2));
    *(v24 - 2) = v15;
  }
  *(v24 - 1) = v28;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v34 = (CA::Render **)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x30uLL, 0x743898A5uLL);
  if (!v34)
  {
LABEL_51:

    return 0;
  }
  v36 = v34;
  *((_DWORD *)v34 + 2) = 1;
  *((_DWORD *)v34 + 3) = 42;
  ++dword_1ECDC7CD0;
  *v34 = (CA::Render *)off_1E15982D0;
  v34[2] = (CA::Render *)v20;
  v34[3] = (CA::Render *)v18;
  v34[4] = 0;
  v51 = 0;
  CA::Render::key_path_set((CA::Render *)&v51, (CFStringRef)a3, v35);
  v38 = v51;
  if (!v51)
    goto LABEL_32;
  if ((v51 & 1) != 0)
  {
    v39 = v51 >> 1;
    goto LABEL_34;
  }
  if (*(_DWORD *)v51)
    LODWORD(v39) = *(_DWORD *)(v51 + 4);
  else
LABEL_32:
    LODWORD(v39) = 0;
LABEL_34:
  CA::Render::key_path_free(v36[4], v37);
  v36[4] = (CA::Render *)v38;
  if (v25)
    v40 = 256;
  else
    v40 = 0;
  v41 = *((_DWORD *)v36 + 3) & 0xFFFFF8FF | v40;
  if (v49)
  {
    v42 = 0;
    while ((_DWORD)v39 != (unsigned __int16)-[CAPresentationModifier initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:]::velocity_atoms[v42])
    {
      if (++v42 == 7)
        goto LABEL_41;
    }
    v43 = 512;
  }
  else
  {
LABEL_41:
    v43 = 0;
  }
  v44 = (_DWORD)v39 == 400 || (_DWORD)v39 == 251;
  v45 = v41 | v43;
  if (v44)
    v46 = 1024;
  else
    v46 = 0;
  *((_DWORD *)v36 + 3) = v45 | v46;
  *((_DWORD *)v36 + 10) = v50;
  v14->_impl = v36;
  v14->_keyPath = (id)objc_msgSend(a3, "copy");
  v14->_group = (CAPresentationModifierGroup *)a8;
  v14->_value_count = v15;
  v14->_f = 1;
  -[CAPresentationModifier setValue:velocity:](v14, "setValue:velocity:", a4, v49);
  return v14;
}

- (void)write
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t value_count;
  BOOL v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int f;
  _QWORD *impl;
  uint64_t v17;
  CAPresentationModifierGroup *group;
  uint64_t v19;
  unsigned int *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  CAPresentationModifierGroup *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(self->_value, "CA_numericValueCount");
  v4 = objc_msgSend(self->_velocity, "CA_numericValueCount");
  v5 = v4;
  value_count = self->_value_count;
  if (v3 != value_count)
    v4 = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifier"), CFSTR("%@: value has more elements (%zu) than initial value (%zu)"), self, v3, value_count);
  if (v5)
    v7 = v5 == v3;
  else
    v7 = 1;
  if (!v7)
    v4 = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifier"), CFSTR("%@: velocity value has more elements (%zu) than value (%zu)"), self, v5, v3);
  v8 = 16 * v3;
  if ((unint64_t)(16 * v3) > 0x1000)
  {
    v9 = (char *)malloc_type_malloc(16 * v3, 0xB7E9333DuLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v4);
    v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, 16 * v3);
  }
  v10 = objc_msgSend(self->_value, "CA_copyNumericValue:", v9);
  v11 = objc_msgSend(self->_velocity, "CA_copyNumericValue:", &v9[8 * v3]);
  v12 = v11;
  v13 = self->_value_count;
  if (v10 <= v13 && v11 <= v13)
  {
    if (v11)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifier"), CFSTR("%@: copied value count (%zu) doesn't match the initial count (%zu)"), self, v10, v13);
  if (!v12)
LABEL_16:
    bzero(&v9[8 * self->_value_count], v8 >> 1);
LABEL_17:
  f = self->_f;
  impl = self->_impl;
  v17 = impl[3];
  group = self->_group;
  if (group)
    v19 = -[CAPresentationModifierGroup shmem](group, "shmem");
  else
    v19 = impl[2];
  v21 = *(_QWORD *)(v19 + 16);
  v20 = *(unsigned int **)(v19 + 24);
  v22 = v21 - 40;
  if (v21 >= 0x28 && v17 < v22 >> 3)
  {
    v23 = (uint64_t)v20 + v21 + -8 * v17;
    v24 = *(unsigned int *)(v23 - 8);
    if ((_DWORD)v24)
    {
      v25 = 2 * v3;
      v26 = (16 * v24) | 8;
      v27 = *(unsigned int *)(v23 - 4);
      v28 = 2 * v24;
      v29 = v22 < v27 || 3 * v26 + v27 > v22;
      if (!v29 && v28 == v25)
      {
        if (v20[1])
          v26 = 0;
        *(_WORD *)((char *)v20 + v27 + v26 + 40) = f & 1;
        v31 = (_QWORD *)((char *)v20 + v27 + v26 + 48);
        v32 = v9;
        do
        {
          v33 = *(_QWORD *)v32;
          v32 += 8;
          *v31++ = v33;
          --v25;
        }
        while (v25);
      }
    }
  }
  v34 = self->_group;
  if (!v34)
  {
    v20[1] = v20[1] == 0;
    while (1)
    {
      v35 = *v20 & 0x7FFFFFFF;
      v36 = *v20 & 0x7FFFFFFE | v20[1];
      while (1)
      {
        v37 = __ldaxr(v20);
        if (v37 != v35)
          break;
        if (!__stlxr(v36, v20))
          goto LABEL_37;
      }
      __clrex();
    }
  }
  -[CAPresentationModifierGroup markWritten:](v34, "markWritten:", v17);
LABEL_37:
  if (v8 > 0x1000)
    free(v9);
}

- (id)value
{
  os_unfair_lock_s *p_l;
  id v4;

  p_l = (os_unfair_lock_s *)&self->_l;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_l);
  v4 = self->_value;
  os_unfair_lock_unlock(p_l);
  return v4;
}

- (NSString)keyPath
{
  return (NSString *)self->_keyPath;
}

- (BOOL)additive
{
  return *((_BYTE *)self->_impl + 13) & 1;
}

- (void)dealloc
{
  unsigned int *impl;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  impl = (unsigned int *)self->_impl;
  if (impl)
  {
    v4 = impl + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)impl + 16))(impl, a2);
  }

  v7.receiver = self;
  v7.super_class = (Class)CAPresentationModifier;
  -[CAPresentationModifier dealloc](&v7, sel_dealloc);
}

- (CAPresentationModifierGroup)group
{
  return self->_group;
}

- (void)setValue:(id)a3
{
  -[CAPresentationModifier setValue:velocity:](self, "setValue:velocity:", a3, 0);
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5 group:(id)a6
{
  return -[CAPresentationModifier initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:](self, "initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:", a3, a4, 0, a5, 0, a6);
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5
{
  return -[CAPresentationModifier initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:](self, "initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:", a3, a4, 0, a5, 0, 0);
}

- (CAPresentationModifier)init
{

  return 0;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; keyPath = %@; additive = %d>"),
               NSStringFromClass(v4),
               self,
               -[CAPresentationModifier keyPath](self, "keyPath"),
               -[CAPresentationModifier additive](self, "additive"));
}

- (void)setEnabled:(BOOL)a3
{
  self->_f = self->_f & 0xFFFFFFFE | a3;
  -[CAPresentationModifier write](self, "write");
}

- (BOOL)isEnabled
{
  return self->_f & 1;
}

@end
