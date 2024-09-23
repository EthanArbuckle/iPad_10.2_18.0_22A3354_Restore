@implementation PHPickerUpdateConfiguration

- (PHPickerUpdateConfiguration)init
{
  PHPickerUpdateConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHPickerUpdateConfiguration;
  result = -[PHPickerUpdateConfiguration init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_selectionLimit = xmmword_20D20B400;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PHPickerUpdateConfiguration *v4;
  PHPickerUpdateConfiguration *v5;
  objc_class *v6;
  BOOL v7;
  objc_class *v9;
  objc_class *v10;
  PHPickerUpdateConfiguration *v11;
  SEL v12;

  v4 = (PHPickerUpdateConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
LABEL_13:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = self->_edgesWithoutContentMargins == v5->_edgesWithoutContentMargins
        && self->_selectionLimit == v5->_selectionLimit
        && self->__didSetEdgesWithoutContentMargins == v5->__didSetEdgesWithoutContentMargins
        && self->__didSetSelectionLimit == v5->__didSetSelectionLimit;

      goto LABEL_13;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v11 = (PHPickerUpdateConfiguration *)_PFAssertFailHandler();
  return -[PHPickerUpdateConfiguration hash](v11, v12);
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_selectionLimit - self->_edgesWithoutContentMargins + 32 * self->_edgesWithoutContentMargins;
  v3 = self->__didSetEdgesWithoutContentMargins - v2 + 32 * v2;
  return self->__didSetSelectionLimit - v3 + 32 * v3 + 923521;
}

- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins
{
  self->_edgesWithoutContentMargins = edgesWithoutContentMargins;
  self->__didSetEdgesWithoutContentMargins = 1;
}

- (void)setSelectionLimit:(NSInteger)selectionLimit
{
  self->_selectionLimit = selectionLimit;
  self->__didSetSelectionLimit = 1;
}

- (BOOL)_isValidConfiguration
{
  int64_t selectionLimit;
  NSObject *v3;
  uint8_t v5[16];

  selectionLimit = self->_selectionLimit;
  if (selectionLimit < 0)
  {
    PLPickerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D1E2000, v3, OS_LOG_TYPE_ERROR, "selection limit is negative", v5, 2u);
    }

  }
  return selectionLimit >= 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(PHPickerUpdateConfiguration);
  *((_QWORD *)result + 3) = self->_edgesWithoutContentMargins;
  *((_QWORD *)result + 2) = self->_selectionLimit;
  *((_BYTE *)result + 8) = self->__didSetEdgesWithoutContentMargins;
  *((_BYTE *)result + 9) = self->__didSetSelectionLimit;
  return result;
}

- (PHPickerUpdateConfiguration)initWithCoder:(id)a3
{
  id v4;
  PHPickerUpdateConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPickerUpdateConfiguration;
  v5 = -[PHPickerUpdateConfiguration init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerUpdateConfigurationCoderEdgesWithoutContentMarginsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_edgesWithoutContentMargins = objc_msgSend(v6, "unsignedIntegerValue");

    v5->_selectionLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerUpdateConfigurationCoderSelectionLimitKey"));
    v5->__didSetEdgesWithoutContentMargins = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerUpdateConfigurationCoderDidSetEdgesWithoutContentMarginsKey"));
    v5->__didSetSelectionLimit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerUpdateConfigurationCoderDidSetSelectionLimitKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t edgesWithoutContentMargins;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  edgesWithoutContentMargins = self->_edgesWithoutContentMargins;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", edgesWithoutContentMargins);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("PHPickerUpdateConfigurationCoderEdgesWithoutContentMarginsKey"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_selectionLimit, CFSTR("PHPickerUpdateConfigurationCoderSelectionLimitKey"));
  objc_msgSend(v7, "encodeBool:forKey:", self->__didSetEdgesWithoutContentMargins, CFSTR("PHPickerUpdateConfigurationCoderDidSetEdgesWithoutContentMarginsKey"));
  objc_msgSend(v7, "encodeBool:forKey:", self->__didSetSelectionLimit, CFSTR("PHPickerUpdateConfigurationCoderDidSetSelectionLimitKey"));

}

- (NSInteger)selectionLimit
{
  return self->_selectionLimit;
}

- (NSDirectionalRectEdge)edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (BOOL)_didSetEdgesWithoutContentMargins
{
  return self->__didSetEdgesWithoutContentMargins;
}

- (BOOL)_didSetSelectionLimit
{
  return self->__didSetSelectionLimit;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
