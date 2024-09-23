@implementation NTKFaceColorPaletteInspector

- (id)description
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *color;
  NSString *pathLocation;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (self->_isTritium)
    v4 = CFSTR(" - tritium");
  else
    v4 = &stru_1E6BDC918;
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@ - %@ - %@%@] "), *(_OWORD *)&self->_domain, self->_propertyName, v4);
  color = self->_color;
  if (color)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0;
      v16 = 0;
      v13 = 0;
      v14 = 0;
      -[UIColor getRed:green:blue:alpha:](self->_color, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.3f, %.3f, %.3f, %.2f]"), v16, v15, v14, v13);
      color = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      color = 0;
    }
  }
  pathLocation = self->_pathLocation;
  if (pathLocation)
  {
    -[NSBundle bundlePath](self->_bundleLocation, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ntk_extractFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ %@: %@"), pathLocation, v9, color);

  }
  else if (self->_fallbackMethodName)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@"), self->_fallbackMethodName, color);
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("NOT FOUND"), v11, v12);
  }

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)pigmentName
{
  return self->_pigmentName;
}

- (void)setPigmentName:(id)a3
{
  objc_storeStrong((id *)&self->_pigmentName, a3);
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (void)setPropertyName:(id)a3
{
  objc_storeStrong((id *)&self->_propertyName, a3);
}

- (NSBundle)bundleLocation
{
  return self->_bundleLocation;
}

- (void)setBundleLocation:(id)a3
{
  objc_storeStrong((id *)&self->_bundleLocation, a3);
}

- (NSString)pathLocation
{
  return self->_pathLocation;
}

- (void)setPathLocation:(id)a3
{
  objc_storeStrong((id *)&self->_pathLocation, a3);
}

- (NSString)fallbackMethodName
{
  return self->_fallbackMethodName;
}

- (void)setFallbackMethodName:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackMethodName, a3);
}

- (BOOL)isTritium
{
  return self->_isTritium;
}

- (void)setIsTritium:(BOOL)a3
{
  self->_isTritium = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fallbackMethodName, 0);
  objc_storeStrong((id *)&self->_pathLocation, 0);
  objc_storeStrong((id *)&self->_bundleLocation, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_pigmentName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
