@implementation NTKFaceEditColorPickerConfiguration

- (NTKFaceEditColorPickerConfiguration)init
{
  NTKFaceEditColorPickerConfiguration *v2;
  uint64_t v3;
  NTKPigmentEditOptionArray *editableColors;
  uint64_t v5;
  NTKPigmentEditOptionArray *nonEditableColors;
  uint64_t v7;
  NSMutableArray *legacyColors;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKFaceEditColorPickerConfiguration;
  v2 = -[NTKFaceEditColorPickerConfiguration init](&v10, sel_init);
  if (v2)
  {
    +[NTKPigmentEditOptionArray array](NTKPigmentEditOptionArray, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    editableColors = v2->_editableColors;
    v2->_editableColors = (NTKPigmentEditOptionArray *)v3;

    +[NTKPigmentEditOptionArray array](NTKPigmentEditOptionArray, "array");
    v5 = objc_claimAutoreleasedReturnValue();
    nonEditableColors = v2->_nonEditableColors;
    v2->_nonEditableColors = (NTKPigmentEditOptionArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    legacyColors = v2->_legacyColors;
    v2->_legacyColors = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)addEditableColor:(id)a3
{
  -[NTKPigmentEditOptionArray addPigment:](self->_editableColors, "addPigment:", a3);
}

- (void)insertEditableColor:(id)a3 atIndex:(unint64_t)a4
{
  -[NTKPigmentEditOptionArray insertPigment:atIndex:](self->_editableColors, "insertPigment:atIndex:", a3, a4);
}

- (void)removeEditableColor:(id)a3
{
  -[NTKPigmentEditOptionArray removePigment:](self->_editableColors, "removePigment:", a3);
}

- (void)removeEditableColorAtIndex:(unint64_t)a3
{
  -[NTKPigmentEditOptionArray removePigmentAtIndex:](self->_editableColors, "removePigmentAtIndex:", a3);
}

- (void)addNonEditableColor:(id)a3
{
  -[NTKPigmentEditOptionArray addPigment:](self->_nonEditableColors, "addPigment:", a3);
}

- (void)insertNonEditableColor:(id)a3 atIndex:(unint64_t)a4
{
  -[NTKPigmentEditOptionArray insertPigment:atIndex:](self->_nonEditableColors, "insertPigment:atIndex:", a3, a4);
}

- (void)removeNonEditableColor:(id)a3
{
  -[NTKPigmentEditOptionArray removePigment:](self->_nonEditableColors, "removePigment:", a3);
}

- (void)removeNonEditableColorAtIndex:(unint64_t)a3
{
  -[NTKPigmentEditOptionArray removePigmentAtIndex:](self->_nonEditableColors, "removePigmentAtIndex:", a3);
}

- (unint64_t)numberOfColors
{
  unint64_t v3;

  v3 = -[NTKPigmentEditOptionArray count](self->_editableColors, "count");
  return -[NTKPigmentEditOptionArray count](self->_nonEditableColors, "count") + v3;
}

- (unint64_t)indexOfColor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_editableColors, "indexOfPigment:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_nonEditableColors, "indexOfPigment:", v4);
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = -[NTKPigmentEditOptionArray count](self->_editableColors, "count") + v6;
  }

  return v5;
}

- (id)colorAtIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v5 = -[NTKPigmentEditOptionArray count](self->_editableColors, "count");
  v6 = 16;
  if (v5 <= a3)
  {
    v7 = v5;
  }
  else
  {
    v6 = 8;
    v7 = 0;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "pigmentAtIndex:", a3 - v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasSeparator
{
  unint64_t v3;

  v3 = -[NTKPigmentEditOptionArray count](self->_editableColors, "count");
  if (v3)
  {
    if (-[NTKPigmentEditOptionArray count](self->_nonEditableColors, "count"))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = self->_canAddColors;
  }
  return v3;
}

- (id)legacyColors
{
  return self->_legacyColors;
}

- (void)addLegacyColor:(id)a3
{
  -[NSMutableArray addObject:](self->_legacyColors, "addObject:", a3);
}

- (void)insertLegacyColor:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->_legacyColors, "insertObject:atIndex:", a3, a4);
}

- (void)removeLegacyColor:(id)a3
{
  -[NSMutableArray removeObject:](self->_legacyColors, "removeObject:", a3);
}

- (void)removeLegacyColorAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_legacyColors, "removeObjectAtIndex:", a3);
}

- (unint64_t)indexOfLegacyColor:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_legacyColors, "indexOfObject:", a3);
}

- (id)legacyColorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_legacyColors, "objectAtIndex:", a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NTKFaceEditColorPickerConfiguration canAddColors](self, "canAddColors"),
        v5 == objc_msgSend(v4, "canAddColors")))
  {
    -[NTKFaceEditColorPickerConfiguration editableColors](self, "editableColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editableColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[NTKFaceEditColorPickerConfiguration nonEditableColors](self, "nonEditableColors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nonEditableColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[NTKFaceEditColorPickerConfiguration legacyColors](self, "legacyColors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "legacyColors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NTKPigmentEditOptionArray)editableColors
{
  return self->_editableColors;
}

- (NTKPigmentEditOptionArray)nonEditableColors
{
  return self->_nonEditableColors;
}

- (BOOL)canAddColors
{
  return self->_canAddColors;
}

- (void)setCanAddColors:(BOOL)a3
{
  self->_canAddColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyColors, 0);
  objc_storeStrong((id *)&self->_nonEditableColors, 0);
  objc_storeStrong((id *)&self->_editableColors, 0);
}

@end
