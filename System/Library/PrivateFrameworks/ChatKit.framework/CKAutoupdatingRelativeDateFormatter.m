@implementation CKAutoupdatingRelativeDateFormatter

- (id)stringFromDate:(id)a3
{
  return -[CKAutoupdatingRelativeDateFormatter stringFromDate:isRelative:](self, "stringFromDate:isRelative:", a3, 0);
}

- (id)stringFromDate:(id)a3 isRelative:(BOOL *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;

  v6 = a3;
  +[CKAutoupdatingRelativeDateFormatter relativeStringFromDate:](CKAutoupdatingRelativeDateFormatter, "relativeStringFromDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v24.receiver = self;
    v24.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
    -[CKAutoupdatingRelativeDateFormatter stringFromDate:](&v24, sel_stringFromDate_, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = (void *)v7;
  -[CKAutoupdatingRelativeDateFormatter dateFormat](self, "dateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  +[CKAutoupdatingRelativeDateFormatter weekdayTemplateCharacters](CKAutoupdatingRelativeDateFormatter, "weekdayTemplateCharacters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", v11, 0, 0, v10);
  v14 = v12 != 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22.receiver = self;
    v22.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
    -[CKAutoupdatingRelativeDateFormatter stringFromDate:](&v22, sel_stringFromDate_, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v12;
    v16 = v13;
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v9);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replaceCharactersInRange:withString:", v15, v16, v18);

    -[CKAutoupdatingRelativeDateFormatter setDateFormat:](self, "setDateFormat:", v17);
    v23.receiver = self;
    v23.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
    -[CKAutoupdatingRelativeDateFormatter stringFromDate:](&v23, sel_stringFromDate_, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAutoupdatingRelativeDateFormatter setDateFormat:](self, "setDateFormat:", v9);

    v8 = (void *)v21;
  }

  if (a4)
LABEL_8:
    *a4 = v14;
LABEL_9:

  return v19;
}

+ (id)relativeDateFormatter
{
  return +[CKDateUtilities theRelativeStandaloneDateFormatter](CKDateUtilities, "theRelativeStandaloneDateFormatter");
}

+ (id)relativeStringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "relativeDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 0);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {

    v6 = 0;
  }
  return v6;
}

+ (id)weekdayTemplateCharacters
{
  if (weekdayTemplateCharacters_once != -1)
    dispatch_once(&weekdayTemplateCharacters_once, &__block_literal_global_176);
  return (id)weekdayTemplateCharacters_sWeekdayTemplateCharacters;
}

void __64__CKAutoupdatingRelativeDateFormatter_weekdayTemplateCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("Eec"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)weekdayTemplateCharacters_sWeekdayTemplateCharacters;
  weekdayTemplateCharacters_sWeekdayTemplateCharacters = v0;

}

@end
