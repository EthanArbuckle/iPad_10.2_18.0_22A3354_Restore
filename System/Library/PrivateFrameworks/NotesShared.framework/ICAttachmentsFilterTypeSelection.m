@implementation ICAttachmentsFilterTypeSelection

- (ICAttachmentsFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  ICAttachmentsFilterTypeSelection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentsFilterTypeSelection;
  result = -[ICAttachmentsFilterTypeSelection init](&v5, sel_init);
  if (result)
    result->_selectionType = a3;
  return result;
}

- (ICAttachmentsFilterTypeSelection)initWithAttachmentSection:(signed __int16)a3
{
  unsigned int v3;
  ICAttachmentsFilterTypeSelection *v4;
  ICAttachmentsFilterTypeSelection *v5;
  BOOL v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentsFilterTypeSelection;
  v4 = -[ICAttachmentsFilterTypeSelection init](&v8, sel_init);
  v5 = v4;
  if (v4)
    v6 = v3 > 7;
  else
    v6 = 1;
  if (!v6)
    -[ICAttachmentsFilterTypeSelection setSelectionType:](v4, "setSelectionType:", qword_1BDC16B48[v3]);
  return v5;
}

- (id)debugDescription
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType");
  if (v3 - 1 > 8)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E76D0B58[v3 - 1];
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("selectionType: %@"), v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICAttachmentsFilterTypeSelection *v4;

  v4 = -[ICAttachmentsFilterTypeSelection init](+[ICAttachmentsFilterTypeSelection allocWithZone:](ICAttachmentsFilterTypeSelection, "allocWithZone:", a3), "init");
  -[ICAttachmentsFilterTypeSelection setSelectionType:](v4, "setSelectionType:", -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ICAttachmentsFilterTypeSelection *v4;
  ICAttachmentsFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICAttachmentsFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICAttachmentsFilterTypeSelection isEqualToICAttachmentsFilterTypeSelection:](self, "isEqualToICAttachmentsFilterTypeSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (int64_t)filterType
{
  return 6;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Attachments"), CFSTR("Attachments"), 0, 1);
}

- (id)rawFilterValue
{
  unint64_t v2;

  v2 = -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType");
  if (v2 - 1 > 8)
    return CFSTR("Unknown");
  else
    return off_1E76D0B58[v2 - 1];
}

- (BOOL)isEqualToICAttachmentsFilterTypeSelection:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType");
  v6 = objc_msgSend(v4, "selectionType");

  return v5 == v6;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
}

@end
