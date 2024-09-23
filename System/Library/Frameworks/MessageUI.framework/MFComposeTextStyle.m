@implementation MFComposeTextStyle

- (MFComposeTextStyle)initWithTextStyleType:(int64_t)a3
{
  MFComposeTextStyle *v4;
  MFComposeTextStyle *v5;
  uint64_t v6;
  NSString *imageName;
  uint64_t v8;
  NSString *accessibilityIdenitifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFComposeTextStyle;
  v4 = -[MFComposeTextStyle init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_styleType = a3;
    objc_msgSend((id)objc_opt_class(), "imageNameForTextStyleType:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    objc_msgSend((id)objc_opt_class(), "accessibilityIdenitifierForTextStyleType:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityIdenitifier = v5->_accessibilityIdenitifier;
    v5->_accessibilityIdenitifier = (NSString *)v8;

    v5->_editSelector = (SEL)objc_msgSend((id)objc_opt_class(), "editSelectorForTextStyleType:", a3);
  }
  return v5;
}

+ (id)composeTextStyleForTextStyleType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTextStyleType:", a3);
}

+ (id)imageNameForTextStyleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 0;
  else
    return *off_1E5A664A0[a3 - 1];
}

+ (id)accessibilityIdenitifierForTextStyleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 0;
  else
    return **((id **)&unk_1E5A66518 + a3 - 1);
}

+ (SEL)editSelectorForTextStyleType:(int64_t)a3
{
  SEL result;

  result = 0;
  switch(a3)
  {
    case 1:
      result = sel_toggleBoldface_;
      break;
    case 2:
      result = sel_toggleItalics_;
      break;
    case 3:
      result = sel_toggleUnderline_;
      break;
    case 4:
      result = sel__toggleStrikeThrough_;
      break;
    case 7:
      result = sel__insertOrderedList_;
      break;
    case 8:
      result = sel__insertUnorderedList_;
      break;
    case 9:
      result = sel__outdent_;
      break;
    case 10:
      result = sel__indent_;
      break;
    case 13:
      result = sel__alignLeft_;
      break;
    case 14:
      result = sel__alignCenter_;
      break;
    case 15:
      result = sel__alignRight_;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)isTextListStyleOrdered:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7[0] = CFSTR("{box}");
  v7[1] = CFSTR("{check}");
  v7[2] = CFSTR("{circle}");
  v7[3] = CFSTR("{diamond}");
  v7[4] = CFSTR("{disc}");
  v7[5] = CFSTR("{hyphen}");
  v7[6] = CFSTR("{square}");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)accessibilityIdenitifier
{
  return self->_accessibilityIdenitifier;
}

- (SEL)editSelector
{
  return self->_editSelector;
}

- (int64_t)styleType
{
  return self->_styleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdenitifier, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
