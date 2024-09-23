@implementation MDLBufferViewAllocator

- (__IOSurface)_regionAtIndex:(int64_t)a3
{
  int64_t *begin;
  int64_t v4;
  __IOSurface *result;

  if (a3 < 0)
  {
    NSLog(CFSTR("regionIndex must be >= 0."), a2);
  }
  else
  {
    begin = self->_regionIndices.__begin_;
    if (a3 >= (unint64_t)(self->_regionIndices.__end_ - begin))
    {
      NSLog(CFSTR("Requested region for index(%ld), does not exist."), a2, a3);
    }
    else
    {
      v4 = begin[a3];
      result = self->_sharedRegions.__begin_[v4];
      if (result)
        return result;
      NSLog(CFSTR("Region at index:%ld is nil."), a2, v4);
    }
  }
  return 0;
}

- (__IOSurface)_regionAtIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5
{
  __IOSurface *v8;
  __IOSurface *v9;
  size_t AllocSize;

  v8 = (__IOSurface *)objc_msgSend__regionAtIndex_(self, a2, a3);
  v9 = v8;
  if (v8)
  {
    if (a4 <= 0)
    {
      NSLog(CFSTR("length(%ld) is invalid."), a4);
      return 0;
    }
    if (a5 < 0)
    {
      NSLog(CFSTR("offset(%ld) is invalid."), a5);
      return 0;
    }
    AllocSize = IOSurfaceGetAllocSize(v8);
    if (a5 + a4 > AllocSize)
    {
      NSLog(CFSTR("Requested length(%ld) + offset(%ld) is greater than the sharedRegion length(%ld) at index: %ld"), a4, a5, AllocSize, a3);
      return 0;
    }
  }
  return v9;
}

- (MDLBufferViewAllocator)initWithSharedRegionsNoCopy:(id)a3
{
  MDLBufferViewAllocator *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __IOSurface **value;
  _QWORD *end;
  __IOSurface **v20;
  int64_t *v21;
  int64_t *v22;
  int64_t *v23;
  int64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  int64_t *v35;
  int64_t v36;
  __IOSurface **v37;
  __IOSurface **v38;
  __IOSurface **begin;
  __IOSurface *v40;
  int64_t *v41;
  int64_t *v42;
  int64_t *v43;
  int64_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  int64_t *v50;
  int64_t v51;
  const char *v52;
  unint64_t v53;
  MDLBufferViewAllocator *v54;
  id v56;
  vector<__IOSurface *, std::allocator<__IOSurface *>> *p_sharedRegions;
  uint64_t p_end_cap;
  void **p_begin;
  id obj;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v66.receiver = self;
  v66.super_class = (Class)MDLBufferViewAllocator;
  v4 = -[MDLBufferViewAllocator init](&v66, sel_init);
  if (!v4)
    goto LABEL_66;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v56;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v62, v67, 16);
  if (!v6)
    goto LABEL_62;
  v7 = 0;
  p_sharedRegions = &v4->_sharedRegions;
  v8 = *(_QWORD *)v63;
  p_end_cap = (uint64_t)&v4->_regionIndices.__end_cap_;
  p_begin = (void **)&v4->_regionIndices.__begin_;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v63 != v8)
        objc_enumerationMutation(obj);
      v10 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = v10;
        if (objc_msgSend_iosurface(v11, v12, v13))
        {
          v16 = objc_msgSend_iosurface(v11, v14, v15);
          v17 = v16;
          end = v4->_sharedRegions.__end_;
          value = v4->_sharedRegions.__end_cap_.__value_;
          if (end >= value)
          {
            v30 = (__IOSurface **)end - p_sharedRegions->__begin_;
            if ((unint64_t)(v30 + 1) >> 61)
              sub_1DCAE4C44();
            v31 = (char *)value - (char *)p_sharedRegions->__begin_;
            v32 = v31 >> 2;
            if (v31 >> 2 <= (unint64_t)(v30 + 1))
              v32 = v30 + 1;
            if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
              v33 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v33 = v32;
            if (v33)
              v34 = (char *)sub_1DCAE79A4((uint64_t)&v4->_sharedRegions.__end_cap_, v33);
            else
              v34 = 0;
            v37 = (__IOSurface **)&v34[8 * v30];
            *v37 = (__IOSurface *)v17;
            v20 = v37 + 1;
            begin = v4->_sharedRegions.__begin_;
            v38 = v4->_sharedRegions.__end_;
            if (v38 != begin)
            {
              do
              {
                v40 = *--v38;
                *--v37 = v40;
              }
              while (v38 != begin);
              v38 = p_sharedRegions->__begin_;
            }
            v4->_sharedRegions.__begin_ = v37;
            v4->_sharedRegions.__end_ = v20;
            v4->_sharedRegions.__end_cap_.__value_ = (__IOSurface **)&v34[8 * v33];
            if (v38)
              operator delete(v38);
          }
          else
          {
            *end = v16;
            v20 = (__IOSurface **)(end + 1);
          }
          v4->_sharedRegions.__end_ = v20;
          v42 = v4->_regionIndices.__end_;
          v41 = v4->_regionIndices.__end_cap_.__value_;
          if (v42 >= v41)
          {
            v44 = (int64_t *)*p_begin;
            v45 = ((char *)v42 - (_BYTE *)*p_begin) >> 3;
            v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 61)
              sub_1DCAE4C44();
            v47 = (char *)v41 - (char *)v44;
            if (v47 >> 2 > v46)
              v46 = v47 >> 2;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
              v48 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v48 = v46;
            if (v48)
            {
              v49 = (char *)sub_1DCAE79A4(p_end_cap, v48);
              v44 = v4->_regionIndices.__begin_;
              v42 = v4->_regionIndices.__end_;
            }
            else
            {
              v49 = 0;
            }
            v50 = (int64_t *)&v49[8 * v45];
            *v50 = v7;
            v43 = v50 + 1;
            while (v42 != v44)
            {
              v51 = *--v42;
              *--v50 = v51;
            }
            v4->_regionIndices.__begin_ = v50;
            v4->_regionIndices.__end_ = v43;
            v4->_regionIndices.__end_cap_.__value_ = (int64_t *)&v49[8 * v48];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v42 = v7;
            v43 = v42 + 1;
          }
          v4->_regionIndices.__end_ = v43;

          v7 = (v7 + 1);
          goto LABEL_60;
        }

      }
      NSLog(CFSTR("Warning cannot find valid iosurface for buffer idx: %d"), v7);
      v22 = v4->_regionIndices.__end_;
      v21 = v4->_regionIndices.__end_cap_.__value_;
      if (v22 >= v21)
      {
        v24 = (int64_t *)*p_begin;
        v25 = ((char *)v22 - (_BYTE *)*p_begin) >> 3;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61)
          sub_1DCAE4C44();
        v27 = (char *)v21 - (char *)v24;
        if (v27 >> 2 > v26)
          v26 = v27 >> 2;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
          v28 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)sub_1DCAE79A4(p_end_cap, v28);
          v24 = v4->_regionIndices.__begin_;
          v22 = v4->_regionIndices.__end_;
        }
        else
        {
          v29 = 0;
        }
        v35 = (int64_t *)&v29[8 * v25];
        *v35 = -1;
        v23 = v35 + 1;
        while (v22 != v24)
        {
          v36 = *--v22;
          *--v35 = v36;
        }
        v4->_regionIndices.__begin_ = v35;
        v4->_regionIndices.__end_ = v23;
        v4->_regionIndices.__end_cap_.__value_ = (int64_t *)&v29[8 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        *v22 = -1;
        v23 = v22 + 1;
      }
      v4->_regionIndices.__end_ = v23;
LABEL_60:

    }
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v62, v67, 16);
  }
  while (v6);
LABEL_62:

  if (v4->_sharedRegions.__end_ != v4->_sharedRegions.__begin_)
  {
    v53 = 0;
    do
    {
      v61 = 0;
      sub_1DCB18668((uint64_t)&v4->_owned, &v61);
      ++v53;
    }
    while (v53 < v4->_sharedRegions.__end_ - v4->_sharedRegions.__begin_);
  }
  v54 = v4;
LABEL_66:

  return v4;
}

- (void)dealloc
{
  __IOSurface **end;
  __IOSurface **begin;
  unint64_t v5;
  unint64_t v6;
  __IOSurface *v7;
  objc_super v8;

  begin = self->_sharedRegions.__begin_;
  end = self->_sharedRegions.__end_;
  if (end != begin)
  {
    v5 = 0;
    do
    {
      v6 = self->_regionIndices.__begin_[v5];
      if (((*(unint64_t *)((char *)self->_owned.__begin_ + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
      {
        v7 = begin[v6];
        if (v7)
        {
          CFRelease(v7);
          begin = self->_sharedRegions.__begin_;
          end = self->_sharedRegions.__end_;
        }
      }
      ++v5;
    }
    while (v5 < end - begin);
  }
  v8.receiver = self;
  v8.super_class = (Class)MDLBufferViewAllocator;
  -[MDLBufferViewAllocator dealloc](&v8, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  unint64_t v6;
  void *v7;
  xpc_object_t XPCObject;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  objc_msgSend_encodeInteger_forKey_(v16, v4, self->_sharedRegions.__end_ - self->_sharedRegions.__begin_, CFSTR("sharedRegions.count"));
  if (self->_sharedRegions.__end_ != self->_sharedRegions.__begin_)
  {
    v6 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("sharedRegions[%zu]"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      XPCObject = IOSurfaceCreateXPCObject(self->_sharedRegions.__begin_[v6]);
      objc_msgSend_stringByAppendingFormat_(v7, v9, (uint64_t)CFSTR(".iosurface"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeXPCObject_forKey_(v16, v11, (uint64_t)XPCObject, v10);

      ++v6;
    }
    while (v6 < self->_sharedRegions.__end_ - self->_sharedRegions.__begin_);
  }
  objc_msgSend_encodeInteger_forKey_(v16, v5, self->_regionIndices.__end_ - self->_regionIndices.__begin_, CFSTR("regionIndices.count"));
  if (self->_regionIndices.__end_ != self->_regionIndices.__begin_)
  {
    v13 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("regionIndices[%zu]"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v16, v15, v13, v14);

      ++v13;
    }
    while (v13 < self->_regionIndices.__end_ - self->_regionIndices.__begin_);
  }

}

- (MDLBufferViewAllocator)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  MDLBufferViewAllocator *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  vector<__IOSurface *, std::allocator<__IOSurface *>> *p_sharedRegions;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  IOSurfaceRef v16;
  IOSurfaceRef v17;
  __IOSurface **value;
  __IOSurface **end;
  __IOSurface **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  __IOSurface **v26;
  __IOSurface **v27;
  __IOSurface **begin;
  __IOSurface *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void **p_begin;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t *v38;
  int64_t *v39;
  int64_t *v40;
  int64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  int64_t *v47;
  int64_t v48;
  MDLBufferViewAllocator *v49;
  char v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MDLBufferViewAllocator;
  v6 = -[MDLBufferViewAllocator init](&v52, sel_init);
  if (v6)
  {
    v8 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("sharedRegions.count"));
    if (v8 >= 1)
    {
      v9 = 0;
      p_sharedRegions = &v6->_sharedRegions;
      do
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("sharedRegions[%zu]"), v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingFormat_(v11, v12, (uint64_t)CFSTR(".iosurface"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeXPCObjectForKey_(v4, v14, (uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = 1;
        sub_1DCB18668((uint64_t)&v6->_owned, &v51);
        v16 = IOSurfaceLookupFromXPCObject(v15);
        v17 = v16;
        end = v6->_sharedRegions.__end_;
        value = v6->_sharedRegions.__end_cap_.__value_;
        if (end >= value)
        {
          v21 = end - p_sharedRegions->__begin_;
          if ((unint64_t)(v21 + 1) >> 61)
            sub_1DCAE4C44();
          v22 = (char *)value - (char *)p_sharedRegions->__begin_;
          v23 = v22 >> 2;
          if (v22 >> 2 <= (unint64_t)(v21 + 1))
            v23 = v21 + 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
            v24 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v25 = (char *)sub_1DCAE79A4((uint64_t)&v6->_sharedRegions.__end_cap_, v24);
          else
            v25 = 0;
          v26 = (__IOSurface **)&v25[8 * v21];
          *v26 = v17;
          v20 = v26 + 1;
          begin = v6->_sharedRegions.__begin_;
          v27 = v6->_sharedRegions.__end_;
          if (v27 != begin)
          {
            do
            {
              v29 = *--v27;
              *--v26 = v29;
            }
            while (v27 != begin);
            v27 = p_sharedRegions->__begin_;
          }
          v6->_sharedRegions.__begin_ = v26;
          v6->_sharedRegions.__end_ = v20;
          v6->_sharedRegions.__end_cap_.__value_ = (__IOSurface **)&v25[8 * v24];
          if (v27)
            operator delete(v27);
        }
        else
        {
          *end = v16;
          v20 = end + 1;
        }
        v6->_sharedRegions.__end_ = v20;

        ++v9;
      }
      while (v9 != v8);
    }
    v31 = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("regionIndices.count"));
    if (v31 >= 1)
    {
      v32 = 0;
      p_begin = (void **)&v6->_regionIndices.__begin_;
      do
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("regionIndices[%zu]"), v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)v34);
        v37 = v36;
        v39 = v6->_regionIndices.__end_;
        v38 = v6->_regionIndices.__end_cap_.__value_;
        if (v39 >= v38)
        {
          v41 = (int64_t *)*p_begin;
          v42 = ((char *)v39 - (_BYTE *)*p_begin) >> 3;
          v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 61)
            sub_1DCAE4C44();
          v44 = (char *)v38 - (char *)v41;
          if (v44 >> 2 > v43)
            v43 = v44 >> 2;
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
            v45 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v45 = v43;
          if (v45)
          {
            v46 = (char *)sub_1DCAE79A4((uint64_t)&v6->_regionIndices.__end_cap_, v45);
            v41 = v6->_regionIndices.__begin_;
            v39 = v6->_regionIndices.__end_;
          }
          else
          {
            v46 = 0;
          }
          v47 = (int64_t *)&v46[8 * v42];
          *v47 = v37;
          v40 = v47 + 1;
          while (v39 != v41)
          {
            v48 = *--v39;
            *--v47 = v48;
          }
          v6->_regionIndices.__begin_ = v47;
          v6->_regionIndices.__end_ = v40;
          v6->_regionIndices.__end_cap_.__value_ = (int64_t *)&v46[8 * v45];
          if (v41)
            operator delete(v41);
        }
        else
        {
          *v39 = v36;
          v40 = v39 + 1;
        }
        v6->_regionIndices.__end_ = v40;

        ++v32;
      }
      while (v32 != v31);
    }
    v49 = v6;
  }

  return v6;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3 length:(int64_t)a4 offset:(int64_t)a5
{
  id result;
  void *BaseAddress;
  MDLBufferView *v11;
  const char *v12;

  result = (id)objc_msgSend__regionAtIndex_length_offset_(self, a2, a3);
  if (result)
  {
    BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)result);
    v11 = [MDLBufferView alloc];
    return (id)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v11, v12, (uint64_t)BaseAddress, a4, a5, a3, self);
  }
  return result;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3
{
  id result;
  __IOSurface *v6;
  void *BaseAddress;
  size_t AllocSize;
  MDLBufferView *v9;
  const char *v10;

  result = (id)objc_msgSend__regionAtIndex_(self, a2, a3);
  if (result)
  {
    v6 = (__IOSurface *)result;
    BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)result);
    AllocSize = IOSurfaceGetAllocSize(v6);
    v9 = [MDLBufferView alloc];
    return (id)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v9, v10, (uint64_t)BaseAddress, AllocSize, 0, a3, self);
  }
  return result;
}

- (void)encodeBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v22;
    v10 = v9[4];
    objc_msgSend_stringByAppendingString_(v8, v11, (uint64_t)CFSTR(".regionIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeInteger_forKey_(v7, v13, v10, v12);

    v14 = v9[3];
    objc_msgSend_stringByAppendingString_(v8, v15, (uint64_t)CFSTR(".offset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeInteger_forKey_(v7, v17, v14, v16);

    v18 = v9[2];
    objc_msgSend_stringByAppendingString_(v8, v19, (uint64_t)CFSTR(".length"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeInteger_forKey_(v7, v21, v18, v20);

  }
}

- (void)encodeBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  unint64_t i;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  char isKindOfClass;
  const char *v23;
  _QWORD *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  id v37;

  v37 = a3;
  v7 = a4;
  v8 = a5;
  v11 = objc_msgSend_count(v37, v9, v10);
  objc_msgSend_stringByAppendingString_(v8, v12, (uint64_t)CFSTR(".count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v7, v14, v11, v13);

  for (i = 0; i < objc_msgSend_count(v37, v15, v16); ++i)
  {
    objc_msgSend_stringByAppendingFormat_(v8, v18, (uint64_t)CFSTR("[%ld]"), i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v37, v20, i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v37, v23, i);
      v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v25 = v24[4];
      objc_msgSend_stringByAppendingString_(v19, v26, (uint64_t)CFSTR(".regionIndex"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v7, v28, v25, v27);

      v29 = v24[3];
      objc_msgSend_stringByAppendingString_(v19, v30, (uint64_t)CFSTR(".offset"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v7, v32, v29, v31);

      v33 = v24[2];
      objc_msgSend_stringByAppendingString_(v19, v34, (uint64_t)CFSTR(".length"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeInteger_forKey_(v7, v36, v33, v35);

    }
  }

}

- (id)decodeBuffersWithCoder:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  const char *v14;
  void *v15;
  uint64_t i;
  void *v17;
  MDLBufferView *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringByAppendingString_(v7, v8, (uint64_t)CFSTR(".count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_decodeIntegerForKey_(v6, v10, (uint64_t)v9);

  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend_initWithCapacity_(v12, v13, v11);
  if (v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend_stringByAppendingFormat_(v7, v14, (uint64_t)CFSTR("[%ld]"), i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(MDLBufferView);
      objc_msgSend_stringByAppendingString_(v17, v19, (uint64_t)CFSTR(".regionIndex"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18->_regionIndex = objc_msgSend_decodeIntegerForKey_(v6, v21, (uint64_t)v20);

      v18->_data = IOSurfaceGetBaseAddress(self->_sharedRegions.__begin_[self->_regionIndices.__begin_[v18->_regionIndex]]);
      objc_msgSend_stringByAppendingString_(v17, v22, (uint64_t)CFSTR(".offset"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18->_offset = objc_msgSend_decodeIntegerForKey_(v6, v24, (uint64_t)v23);

      objc_msgSend_stringByAppendingString_(v17, v25, (uint64_t)CFSTR(".length"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18->_length = objc_msgSend_decodeIntegerForKey_(v6, v27, (uint64_t)v26);

      objc_storeStrong((id *)&v18->_allocator, self);
      objc_msgSend_addObject_(v15, v28, (uint64_t)v18);

    }
  }

  return v15;
}

- (id)decodeBufferWithCoder:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  MDLMeshBufferView *v8;
  const char *v9;
  void *v10;
  const char *v11;
  unint64_t regionIndex;
  int64_t *begin;
  unint64_t v14;
  __IOSurface **v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MDLBufferViewAllocator *v22;
  MDLBufferViewAllocator *allocator;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MDLMeshBufferView);
  objc_msgSend_stringByAppendingString_(v7, v9, (uint64_t)CFSTR(".regionIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8->super._regionIndex = objc_msgSend_decodeIntegerForKey_(v6, v11, (uint64_t)v10);

  regionIndex = v8->super._regionIndex;
  if ((regionIndex & 0x8000000000000000) != 0
    || (begin = self->_regionIndices.__begin_, regionIndex >= self->_regionIndices.__end_ - begin)
    || (v14 = begin[regionIndex], (v14 & 0x8000000000000000) != 0)
    || (v15 = self->_sharedRegions.__begin_, v14 >= self->_sharedRegions.__end_ - v15))
  {
    v8->super._data = 0;
    v8->super._length = 0;
    v8->super._offset = 0;
    allocator = v8->super._allocator;
    v8->super._allocator = 0;
  }
  else
  {
    v8->super._data = IOSurfaceGetBaseAddress(v15[v14]);
    objc_msgSend_stringByAppendingString_(v7, v16, (uint64_t)CFSTR(".offset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->super._offset = objc_msgSend_decodeIntegerForKey_(v6, v18, (uint64_t)v17);

    objc_msgSend_stringByAppendingString_(v7, v19, (uint64_t)CFSTR(".length"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->super._length = objc_msgSend_decodeIntegerForKey_(v6, v21, (uint64_t)v20);

    v22 = self;
    allocator = v8->super._allocator;
    v8->super._allocator = v22;
  }

  return v8;
}

- (void).cxx_destruct
{
  int64_t *begin;
  unint64_t *v4;
  __IOSurface **v5;

  begin = self->_regionIndices.__begin_;
  if (begin)
  {
    self->_regionIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_owned.__begin_;
  if (v4)
    operator delete(v4);
  v5 = self->_sharedRegions.__begin_;
  if (v5)
  {
    self->_sharedRegions.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
