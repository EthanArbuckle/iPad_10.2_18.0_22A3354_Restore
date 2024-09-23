@implementation CMFallStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFallStats)initWithCoder:(id)a3
{
  CMFallStats *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMFallStats;
  v4 = -[CMFallStats init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_data = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMFallStatsCodingKeyData"), v7);
    objc_msgSend__decodeMeta(v4, v8, v9, v10, v11);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_data, (uint64_t)CFSTR("kCMFallStatsCodingKeyData"), v3);
}

- (CMFallStats)initWithData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMFallStats *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, v3, v4))
    return 0;
  v17.receiver = self;
  v17.super_class = (Class)CMFallStats;
  v11 = -[CMFallStats init](&v17, sel_init);
  if (v11)
  {
    v11->_data = (NSData *)objc_msgSend_copy(a3, v7, v8, v9, v10);
    objc_msgSend__decodeMeta(v11, v12, v13, v14, v15);
  }
  return v11;
}

- (CMFallStats)initWithBufferAndLength:(char *)a3 length:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  CMFallStats *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if (!a3)
    return 0;
  v14.receiver = self;
  v14.super_class = (Class)CMFallStats;
  v8 = -[CMFallStats init](&v14, sel_init);
  if (v8)
  {
    v8->_data = (NSData *)(id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)a3, a4, v7);
    objc_msgSend__decodeMeta(v8, v9, v10, v11, v12);
  }
  return v8;
}

- (id)itemsIterator
{
  CMFallStatsItemsIterator *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = [CMFallStatsItemsIterator alloc];
  return (id)objc_msgSend_initWithData_(v3, v4, (uint64_t)self->_data, v5, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMFallStats;
  -[CMFallStats dealloc](&v3, sel_dealloc);
}

- (void)_decodeMeta
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  _BYTE v44[16];
  std::__shared_weak_count *v45;
  uint64_t v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  _QWORD v49[3];
  _BYTE v50[200];
  int v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  self->_iOStime = 0.0;
  self->_fallType = 0;
  self->_isNearFall = 0;
  if (self->_data)
  {
    sub_18F2A7F74(v50, a2);
    v7 = objc_msgSend_bytes(self->_data, v3, v4, v5, v6);
    v12 = objc_msgSend_length(self->_data, v8, v9, v10, v11);
    v49[0] = &off_1E2951C80;
    v49[1] = v7;
    v49[2] = v12;
    if (sub_18F2A8078((uint64_t)v50, (uint64_t)v49))
    {
      sub_18F2A7EE4(&v46, (uint64_t)v50);
      while (v46)
      {
        if (self->_iOStime != 0.0)
          break;
        v13 = *(_QWORD *)(v47 + 1000);
        if (v13)
        {
          v14 = *(_QWORD *)(v13 + 88);
          if (v14)
          {
            v15 = *(double *)(v47 + 616);
            self->_iOStime = v15;
            self->_fallType = *(_DWORD *)(v14 + 12);
            self->_isNearFall = *(_BYTE *)(v14 + 70);
            if (v15 != 0.0)
            {
              if (qword_1EE16D828 != -1)
                dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
              v16 = qword_1EE16D830;
              if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
              {
                v21 = (void *)objc_msgSend_description(self, v17, v18, v19, v20);
                v26 = objc_msgSend_UTF8String(v21, v22, v23, v24, v25);
                *(_DWORD *)buf = 136315138;
                v54 = v26;
                _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEBUG, "Decoded CMFallStats meta and found fall snippet metadata item [%s]", buf, 0xCu);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D828 != -1)
                  dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
                v34 = (void *)objc_msgSend_description(self, v30, v31, v32, v33);
                v39 = objc_msgSend_UTF8String(v34, v35, v36, v37, v38);
                v51 = 136315138;
                v52 = v39;
                v40 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMFallStats _decodeMeta]", "CoreLocation: %s\n", v40);
                if (v40 != (char *)buf)
                  free(v40);
              }
            }
          }
        }
        sub_18F374854((uint64_t)v44, (uint64_t)&v46);
        v27 = v45;
        if (v45)
        {
          p_shared_owners = (unint64_t *)&v45->__shared_owners_;
          do
            v29 = __ldaxr(p_shared_owners);
          while (__stlxr(v29 - 1, p_shared_owners));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
      }
      sub_18F2A7FB8((uint64_t)v50);
      v41 = v48;
      if (v48)
      {
        v42 = (unint64_t *)&v48->__shared_owners_;
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        if (!v43)
        {
          ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
          std::__shared_weak_count::__release_weak(v41);
        }
      }
    }
    sub_18F2A7FB4((uint64_t)v50);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@, Time,%.3lf,Type,CMFallStats,fallType,%d,isNearFall,%d"), v7, v8, v5, *(_QWORD *)&self->_iOStime, self->_fallType, self->_isNearFall);
}

- (double)iOStime
{
  return self->_iOStime;
}

- (int)fallType
{
  return self->_fallType;
}

- (BOOL)isNearFall
{
  return self->_isNearFall;
}

- (id)binarySampleRepresentation
{
  return self->_data;
}

- (id)sr_exportRepresentationEnumerator
{
  return (id)((uint64_t (*)(CMFallStats *, char *))MEMORY[0x1E0DE7D20])(self, sel_itemsIterator);
}

@end
