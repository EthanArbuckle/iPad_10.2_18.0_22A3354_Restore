@implementation CalDescriptionBuilder

- (CalDescriptionBuilder)initWithSuperclassDescription:(id)a3
{
  id v5;
  CalDescriptionBuilder *v6;
  CalDescriptionBuilder *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *descriptionUnderConstruction;
  NSString *keyDelimiter;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalDescriptionBuilder;
  v6 = -[CalDescriptionBuilder init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_superclassDescription, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    descriptionUnderConstruction = v7->_descriptionUnderConstruction;
    v7->_descriptionUnderConstruction = v8;

    v7->_sortedByKey = 1;
    keyDelimiter = v7->_keyDelimiter;
    v7->_keyDelimiter = (NSString *)CFSTR(", ");

  }
  return v7;
}

- (void)setKey:(id)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setObject:forKey:", v6, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
}

- (NSMutableDictionary)descriptionUnderConstruction
{
  return self->_descriptionUnderConstruction;
}

- (id)build
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDescriptionBuilder superclassDescription](self, "superclassDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "appendString:", v6);
  if (-[CalDescriptionBuilder sortedByKey](self, "sortedByKey"))
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_39);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[CalDescriptionBuilder keyDelimiter](self, "keyDelimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__CalDescriptionBuilder_build__block_invoke_2;
  v16[3] = &unk_1E2A85D88;
  v17 = v4;
  v18 = v6;
  v9 = v3;
  v19 = v9;
  v20 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  v13 = v20;
  v14 = v9;

  return v14;
}

- (NSString)superclassDescription
{
  return self->_superclassDescription;
}

- (BOOL)sortedByKey
{
  return self->_sortedByKey;
}

- (NSString)keyDelimiter
{
  return self->_keyDelimiter;
}

void __30__CalDescriptionBuilder_build__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 || *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("%@%@: [%@]"), *(_QWORD *)(a1 + 56), v7, v5);
  else
    objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("%@: [%@]"), v7, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDelimiter, 0);
  objc_storeStrong((id *)&self->_superclassDescription, 0);
  objc_storeStrong((id *)&self->_descriptionUnderConstruction, 0);
}

uint64_t __30__CalDescriptionBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (CalDescriptionBuilder)init
{
  return -[CalDescriptionBuilder initWithSuperclassDescription:](self, "initWithSuperclassDescription:", 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)CalDescriptionBuilder;
  -[CalDescriptionBuilder description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Keys: [%@]"), v6);

  CalBooleanAsString(-[CalDescriptionBuilder sortedByKey](self, "sortedByKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Sorted by key: [%@]"), v7);

  -[CalDescriptionBuilder keyDelimiter](self, "keyDelimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Key delimiter: [%@]"), v8);

  -[CalDescriptionBuilder superclassDescription](self, "superclassDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Superclass description: [%@]"), v9);

  return v3;
}

- (void)setKey:(id)a3 withEnumNumericalValue:(int64_t)a4 andStringValue:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a3;
  v10 = [v8 alloc];
  if (v15)
    v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("%ld (%@)"), a4, v15);
  else
    v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("%ld"), a4, v14);
  v12 = (void *)v11;
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v9);

}

- (void)setKey:(id)a3 withBoolean:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  CalBooleanAsString(v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

- (void)setKey:(id)a3 withChar:(char)a4
{
  int v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%c"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withCharArray:(const char *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithUTF8String:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withDouble:(double)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withFloat:(float)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%f"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withInt:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%d"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withInteger:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%ld"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withLong:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%ld"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withLongLong:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%lld"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withShort:(signed __int16)a4
{
  int v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%hi"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedChar:(unsigned __int8)a4
{
  unsigned int v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%c"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedInt:(unsigned int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%u"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedInteger:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%lu"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedLong:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%lu"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedLongLong:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%llu"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withUnsignedShort:(unsigned __int16)a4
{
  unsigned int v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%hu"), v4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withCGColor:(const CGColor *)a4
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  NumberOfComponents = CGColorGetNumberOfComponents(a4);
  Components = CGColorGetComponents(a4);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); NumberOfComponents; --NumberOfComponents)
  {
    v9 = *(_QWORD *)Components++;
    objc_msgSend(i, "appendFormat:", CFSTR("%f"), v9);
  }
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(i, "copy");
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

}

- (void)setKey:(id)a3 withClass:(Class)a4
{
  id v6;

  v6 = a3;
  -[CalDescriptionBuilder setKey:withCharArray:](self, "setKey:withCharArray:", v6, class_getName(a4));

}

- (void)setKey:(id)a3 withPointerAddress:(const void *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%p"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setKey:(id)a3 withSelector:(SEL)a4
{
  id v6;

  v6 = a3;
  -[CalDescriptionBuilder setKey:withCharArray:](self, "setKey:withCharArray:", v6, sel_getName(a4));

}

- (void)setKey:(id)a3 withSize:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%zd"), a4);
  -[CalDescriptionBuilder descriptionUnderConstruction](self, "descriptionUnderConstruction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

}

- (void)setDescriptionUnderConstruction:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionUnderConstruction, a3);
}

- (void)setSuperclassDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSortedByKey:(BOOL)a3
{
  self->_sortedByKey = a3;
}

- (void)setKeyDelimiter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
