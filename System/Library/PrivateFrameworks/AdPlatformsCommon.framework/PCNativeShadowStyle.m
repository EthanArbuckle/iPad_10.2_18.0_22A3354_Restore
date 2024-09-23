@implementation PCNativeShadowStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeShadowStyle)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;

  v4 = a3;
  v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("color"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v17;

    objc_msgSend_decodeDoubleForKey_(v4, v19, (uint64_t)CFSTR("opacity"), v20, v21, v22, v23);
    *(double *)(v11 + 16) = v24;
    objc_msgSend_decodeDoubleForKey_(v4, v25, (uint64_t)CFSTR("radius"), v26, v27, v24, v28);
    *(_QWORD *)(v11 + 24) = v29;
    v30 = (void *)MEMORY[0x24BDBCF20];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend_setWithObjects_(v30, v33, v31, v34, v35, v36, v37, v32, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, (uint64_t)CFSTR("offsets"), v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v43;

  }
  return (PCNativeShadowStyle *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  id v48;

  v4 = a3;
  objc_msgSend_color(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("color"), v13, v14, v15);

  objc_msgSend_opacity(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeDouble_forKey_(v4, v22, (uint64_t)CFSTR("opacity"), v23, v24, v25, v26);
  objc_msgSend_radius(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeDouble_forKey_(v4, v33, (uint64_t)CFSTR("radius"), v34, v35, v36, v37);
  objc_msgSend_offsets(self, v38, v39, v40, v41, v42, v43);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v48, (uint64_t)CFSTR("offsets"), v45, v46, v47);

}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_offsets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
