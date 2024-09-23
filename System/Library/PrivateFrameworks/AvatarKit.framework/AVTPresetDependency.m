@implementation AVTPresetDependency

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  AVTPreset *preset;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTPresetCategoryToString(self->_category);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p %@ →"), v5, self, v6);

  preset = self->_preset;
  if (preset)
  {
    -[AVTPreset identifier](preset, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" preset: %@"), v9);

  }
  if (self->_morphVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" morph variant: %@"), self->_morphVariant);
  if (self->_imageVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" image variant: %@"), self->_imageVariant);
  if (self->_materialVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" material variant: %@"), self->_materialVariant);
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (void)setMaterialVariant:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setVisibilityRules:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityRules, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);
  objc_storeStrong((id *)&self->_preset, 0);
}

@end
