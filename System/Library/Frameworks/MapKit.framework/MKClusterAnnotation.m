@implementation MKClusterAnnotation

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;

  *(_BYTE *)&self->_flags |= 2u;
  v4 = (NSString *)-[NSString copy](title, "copy");
  v5 = self->__title;
  self->__title = v4;

}

- (NSString)title
{
  NSString *title;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  title = self->__title;
  if (!title)
  {
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      title = 0;
    }
    else
    {
      -[MKClusterAnnotation memberAnnotations](self, "memberAnnotations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (NSString *)objc_msgSend(v6, "copy");
        v8 = self->__title;
        self->__title = v7;

      }
      *(_BYTE *)&self->_flags |= 2u;

      title = self->__title;
    }
  }
  return title;
}

- (void)setSubtitle:(NSString *)subtitle
{
  NSString *v4;
  NSString *v5;

  *(_BYTE *)&self->_flags |= 4u;
  v4 = (NSString *)-[NSString copy](subtitle, "copy");
  v5 = self->__subtitle;
  self->__subtitle = v4;

}

- (NSString)subtitle
{
  NSString *subtitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  subtitle = self->__subtitle;
  if (!subtitle)
  {
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      subtitle = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_memberAnnotations, "count") - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      _MKLocalizedStringFromThisBundle(CFSTR("MoreAnnotations"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v6);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->__subtitle;
      self->__subtitle = v8;

      *(_BYTE *)&self->_flags |= 4u;
      subtitle = self->__subtitle;
    }
  }
  return subtitle;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    -[MKClusterAnnotation _averageCoordinate](self, "_averageCoordinate");
    self->__coordinate.latitude = v3;
    self->__coordinate.longitude = v4;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | ((objc_opt_respondsToSelector() & 1) == 0);
  }
  latitude = self->__coordinate.latitude;
  longitude = self->__coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (MKClusterAnnotation)initWithMemberAnnotations:(NSArray *)memberAnnotations
{
  MKClusterAnnotation *v4;
  uint64_t v5;
  NSArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKClusterAnnotation;
  v4 = -[MKClusterAnnotation init](&v8, sel_init);
  if (v4)
  {
    v5 = -[NSArray copy](memberAnnotations, "copy");
    v6 = v4->_memberAnnotations;
    v4->_memberAnnotations = (NSArray *)v5;

  }
  return v4;
}

- (void)_memberAnnotationCoordinateDidChange
{
  -[MKClusterAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("coordinate"));
  *(_BYTE *)&self->_flags &= ~1u;
  -[MKClusterAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("coordinate"));
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_memberAnnotations, "hash");
}

- (BOOL)_isMKClusterAnnotation
{
  return 1;
}

- (CLLocationCoordinate2D)_averageCoordinate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  void *v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationCoordinate2D v15;
  double latitude;
  double longitude;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CLLocationCoordinate2D result;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MKClusterAnnotation memberAnnotations](self, "memberAnnotations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "coordinate");
        v8 = v8 + v10;
        v7 = v7 + v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }

  -[MKClusterAnnotation memberAnnotations](self, "memberAnnotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 / (double)(unint64_t)objc_msgSend(v12, "count");
  -[MKClusterAnnotation memberAnnotations](self, "memberAnnotations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CLLocationCoordinate2DMake(v13, v7 / (double)(unint64_t)objc_msgSend(v14, "count"));

  latitude = v15.latitude;
  longitude = v15.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  NSUInteger v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "_isMKClusterAnnotation"))
    return 0;
  v5 = (void *)*((_QWORD *)a3 + 1);
  v6 = -[NSArray count](self->_memberAnnotations, "count");
  if (v6 != objc_msgSend(v5, "count"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_memberAnnotations;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectAtIndex:", v10 + i, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v14)
        {
          v15 = 0;
          goto LABEL_14;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 += i;
      if (v9)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_14:

  return v15;
}

- (NSArray)memberAnnotations
{
  return self->_memberAnnotations;
}

- (NSString)clusteringIdentifier
{
  return self->_clusteringIdentifier;
}

- (void)setClusteringIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__subtitle, 0);
  objc_storeStrong((id *)&self->__title, 0);
  objc_storeStrong((id *)&self->_clusteringIdentifier, 0);
  objc_storeStrong((id *)&self->_memberAnnotations, 0);
}

@end
