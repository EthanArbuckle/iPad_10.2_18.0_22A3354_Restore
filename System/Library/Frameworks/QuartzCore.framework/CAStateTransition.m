@implementation CAStateTransition

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAStateTransition setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (NSString)fromState
{
  return self->_fromState;
}

- (NSString)toState
{
  return self->_toState;
}

- (double)duration
{
  NSArray *elements;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  elements = self->_elements;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v23;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v5)
        objc_enumerationMutation(elements);
      v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "animation");
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v8, "beginTime");
        v11 = v10;
        objc_msgSend(v9, "duration");
        if ((*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "speed");
          if (v13 == 0.0)
          {
            v12 = INFINITY;
          }
          else
          {
            v14 = fabsf(v13);
            v15 = 1.0;
            if (v14 != 1.0)
              v15 = 1.0 / v14;
            objc_msgSend(v9, "repeatDuration");
            if (v16 == 0.0)
            {
              objc_msgSend(v9, "duration");
              v15 = v17 * v15;
              if (objc_msgSend(v9, "autoreverses"))
                v15 = v15 + v15;
              objc_msgSend(v9, "repeatCount");
              if (v18 <= 0.0)
                v16 = 1.0;
              else
                v16 = v18;
            }
            v12 = v16 * v15;
          }
        }
        v19 = v12 + v11;
        if (v19 > v6)
          v6 = v19;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  }
  while (v4);
  return v6;
}

- (NSArray)elements
{
  return self->_elements;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setToState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setFromState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

- (id)CAMLTypeForKey:(id)a3
{
  void *v4;

  v4 = (void *)-[CAStateTransition CAMLTypeForKey:]::dict;
  if (!-[CAStateTransition CAMLTypeForKey:]::dict)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("fromState"), CFSTR("string"), CFSTR("toState"), CFSTR("NSArray"), CFSTR("elements"), 0);
    -[CAStateTransition CAMLTypeForKey:]::dict = (uint64_t)v4;
  }
  return (id)objc_msgSend(v4, "objectForKey:", a3);
}

- (CAStateTransition)init
{
  CAStateTransition *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)CAStateTransition;
  v2 = -[CAStateTransition init](&v4, sel_init);
  if (v2)
  {
    v2->_fromState = (NSString *)CFSTR("*");
    v2->_toState = (NSString *)CFSTR("*");
  }
  return v2;
}

- (CAStateTransition)initWithCoder:(id)a3
{
  CAStateTransition *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateTransition;
  v4 = -[CAStateTransition init](&v6, sel_init);
  if (v4)
  {
    v4->_fromState = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromState")), "copy");
    v4->_toState = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toState")), "copy");
    v4->_elements = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("elements")), "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateTransition;
  -[CAStateTransition dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *fromState;
  NSString *toState;

  fromState = self->_fromState;
  if (fromState)
    objc_msgSend(a3, "setElementAttribute:forKey:", fromState, CFSTR("fromState"));
  toState = self->_toState;
  if (toState)
    objc_msgSend(a3, "setElementAttribute:forKey:", toState, CFSTR("toState"));
  if (self->_elements)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("elements"));
    objc_msgSend(a3, "encodeObject:", self->_elements);
    objc_msgSend(a3, "endElement");
  }
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fromState;
  NSString *toState;
  NSArray *elements;

  fromState = self->_fromState;
  if (fromState)
    objc_msgSend(a3, "encodeObject:forKey:", fromState, CFSTR("fromState"));
  toState = self->_toState;
  if (toState)
    objc_msgSend(a3, "encodeObject:forKey:", toState, CFSTR("toState"));
  elements = self->_elements;
  if (elements)
    objc_msgSend(a3, "encodeObject:forKey:", elements, CFSTR("elements"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateTransition *v4;

  v4 = objc_alloc_init(CAStateTransition);
  -[CAStateTransition setFromState:](v4, "setFromState:", self->_fromState);
  -[CAStateTransition setToState:](v4, "setToState:", self->_toState);
  -[CAStateTransition setElements:](v4, "setElements:", self->_elements);
  return v4;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAStateTransition fromState=%@ toState=%@ %@>"), self->_fromState, self->_toState, self->_elements);
}

@end
