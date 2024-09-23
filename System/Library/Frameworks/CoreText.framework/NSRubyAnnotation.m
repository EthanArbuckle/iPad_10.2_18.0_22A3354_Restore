@implementation NSRubyAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v6;
  uint64_t v7;
  double v8;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRubyAnnotation.cpp"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));
    if (self)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(a3, "encodeInt:forKey:", 255, CFSTR("Alignment"));
    objc_msgSend(a3, "encodeInt:forKey:", 255, CFSTR("Overhang"));
    LODWORD(v8) = 0;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("SizeFactor"), v8);
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("TextBefore"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("TextAfter"));
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("TextInterCharacter"));
    v7 = 0;
    goto LABEL_4;
  }
  if (!self)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(a3, "encodeInt:forKey:", *(unsigned __int8 *)self[5].super.isa, CFSTR("Alignment"));
  objc_msgSend(a3, "encodeInt:forKey:", *((unsigned __int8 *)self[5].super.isa + 1), CFSTR("Overhang"));
  v6 = *((double *)self[5].super.isa + 1);
  *(float *)&v6 = v6;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("SizeFactor"), v6);
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self[5].super.isa + 2), CFSTR("TextBefore"));
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self[5].super.isa + 3), CFSTR("TextAfter"));
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self[5].super.isa + 4), CFSTR("TextInterCharacter"));
  v7 = *((_QWORD *)self[5].super.isa + 5);
LABEL_4:
  objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("TextInline"));
}

- (NSRubyAnnotation)initWithCoder:(id)a3
{
  NSRubyAnnotation *v6;
  char v7;
  char v8;
  float v9;
  float v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSRubyAnnotation *v16;
  id v18;
  id v19;
  objc_super v20;
  id v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRubyAnnotation.cpp"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));
  v20.receiver = self;
  v20.super_class = (Class)NSRubyAnnotation;
  v6 = -[NSRubyAnnotation init](&v20, sel_init);
  v7 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("Alignment"));
  v8 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("Overhang"));
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("SizeFactor"));
  v10 = v9;
  v22[0] = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TextBefore"));
  v22[1] = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TextAfter"));
  v22[2] = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TextInterCharacter"));
  v22[3] = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TextInline"));
  v19 = (id)0xAAAAAAAAAAAAAAAALL;
  v11 = TCFBase<TRubyAnnotation>::Allocate();
  if (v11)
  {
    v12 = (char *)v11;
    v13 = 0;
    *(_BYTE *)(v11 + 48) = v7;
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = TRubyAnnotation::Hash;
    *(_QWORD *)(v11 + 32) = 0;
    *(_QWORD *)(v11 + 40) = v11 + 48;
    *(_BYTE *)(v11 + 49) = v8;
    *(double *)(v11 + 56) = v10;
    *(_BYTE *)(v11 + 96) = 0;
    *(_WORD *)(v11 + 120) = 256;
    *(_QWORD *)(v11 + 104) = 0;
    *(_QWORD *)(v11 + 112) = 0;
    do
    {
      *(_QWORD *)&v12[v13 * 8 + 64] = (id)v22[v13];
      ++v13;
    }
    while (v13 != 4);
    v21 = v12;
    do
      v14 = (void *)__ldaxr((unint64_t *)&v21);
    while (__stlxr(0, (unint64_t *)&v21));
    v18 = v14;

  }
  else
  {
    v18 = 0;
  }
  do
    v15 = (void *)__ldaxr((unint64_t *)&v18);
  while (__stlxr(0, (unint64_t *)&v18));
  v19 = v15;

  do
    v16 = (NSRubyAnnotation *)__ldaxr((unint64_t *)&v19);
  while (__stlxr(0, (unint64_t *)&v19));

  return v16;
}

@end
