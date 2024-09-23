@implementation _CLLSLMapRoadSegment

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLLSLMapRoadSegment;
  -[_CLLSLMapRoadSegment dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = self->_roadID;
  v12[2] = objc_msgSend_copyWithZone_(self->_polylines, v13, (uint64_t)a3, v14);
  return v12;
}

- (_CLLSLMapRoadSegment)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLLSLMapRoadSegment *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CLLSLMapRoadSegment;
  v6 = -[_CLLSLMapRoadSegment init](&v15, sel_init);
  if (v6)
  {
    v6->_roadID = objc_msgSend_decodeInt64ForKey_(a3, v4, (uint64_t)CFSTR("roadID"), v5);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v6->_polylines = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v13, v12, (uint64_t)CFSTR("polylines"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_roadID, (uint64_t)CFSTR("roadID"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_polylines, (uint64_t)CFSTR("polylines"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_msgSend_polylines(self, v8, v9, v10);
  v14 = objc_msgSend_stringWithFormat_(v7, v12, (uint64_t)CFSTR("<NSArray: %p> {\n"), v13, v11);
  objc_msgSend_appendString_(v6, v15, v14, v16);
  v20 = (void *)objc_msgSend_polylines(self, v17, v18, v19);
  v24 = objc_msgSend_count(v20, v21, v22, v23);
  if (v24)
  {
    v28 = v24;
    v29 = 0;
    v30 = v24 - 1;
    do
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = (void *)objc_msgSend_polylines(self, v25, v26, v27);
      v35 = objc_msgSend_objectAtIndex_(v32, v33, v29, v34);
      v38 = objc_msgSend_stringWithFormat_(v31, v36, (uint64_t)CFSTR("%@%@%@"), v37, a3, CFSTR("\t"), v35);
      objc_msgSend_appendString_(v6, v39, v38, v40);
      v43 = v29 + 1;
      if (v30 == v29)
        objc_msgSend_appendString_(v6, v41, (uint64_t)CFSTR("\n"), v42);
      else
        objc_msgSend_appendString_(v6, v41, (uint64_t)CFSTR(",\n"), v42);
      ++v29;
    }
    while (v28 != v43);
  }
  v44 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("%@}"), v27, a3);
  objc_msgSend_appendString_(v6, v45, v44, v46);
  v47 = (void *)MEMORY[0x1E0CB3940];
  v51 = objc_msgSend_roadID(self, v48, v49, v50);
  return (id)objc_msgSend_stringWithFormat_(v47, v52, (uint64_t)CFSTR("<_CLLSLMapRoadSegment: %p> {\n%@.roadID = %llu,\n%@.polylines = %@\n%@}"), v53, self, a3, v51, a3, v6, a4);
}

- (unint64_t)roadID
{
  return self->_roadID;
}

- (void)setRoadID:(unint64_t)a3
{
  self->_roadID = a3;
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (void)setPolylines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
