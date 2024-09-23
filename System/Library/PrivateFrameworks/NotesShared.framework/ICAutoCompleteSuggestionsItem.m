@implementation ICAutoCompleteSuggestionsItem

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 rightText:(id)a5 uuidString:(id)a6 isEmptyPlaceholder:(BOOL)a7 isSectionHeader:(BOOL)a8 isCreationSuggestion:(BOOL)a9 iconImage:(id)a10 parentNoteIdentifier:(id)a11 representedObject:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ICAutoCompleteSuggestionsItem *v23;
  ICAutoCompleteSuggestionsItem *v24;
  id obj;
  id v27;
  id v30;
  objc_super v31;

  v17 = a3;
  v18 = a4;
  obj = a5;
  v19 = a5;
  v27 = a6;
  v30 = a6;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ICAutoCompleteSuggestionsItem;
  v23 = -[ICAutoCompleteSuggestionsItem init](&v31, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_displayText, a3);
    objc_storeStrong((id *)&v24->_shortText, a4);
    objc_storeStrong((id *)&v24->_rightText, obj);
    objc_storeStrong((id *)&v24->_uuidString, v27);
    v24->_isEmptyPlaceholder = a7;
    v24->_isSectionHeader = a8;
    v24->_isCreationSuggestion = a9;
    objc_storeStrong((id *)&v24->_iconImage, a10);
    objc_storeStrong((id *)&v24->_parentNoteIdentifier, a11);
    objc_storeStrong((id *)&v24->_representedObject, a12);
  }

  return v24;
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 isSectionHeader:(BOOL)a7 iconImage:(id)a8 representedObject:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:rightText:uuidString:isEmptyPlaceholder:isSectionHeader:isCreationSuggestion:iconImage:parentNoteIdentifier:representedObject:](self, "initWithDisplayText:shortText:rightText:uuidString:isEmptyPlaceholder:isSectionHeader:isCreationSuggestion:iconImage:parentNoteIdentifier:representedObject:", a3, a4, 0, a5, a6, a7, v10, a8, 0, a9);
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 iconImage:(id)a6
{
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:iconImage:representedObject:](self, "initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:iconImage:representedObject:", a3, a4, a5, 0, a6, 0);
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 representedObject:(id)a4 isEmptyPlaceholder:(BOOL)a5
{
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:](self, "initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:", a3, 0, 0, a5, 0, 0, a4);
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 isSectionHeader:(BOOL)a4
{
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:](self, "initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:", a3, 0, 0, 0, a4, 0, 0);
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 representedObject:(id)a5
{
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:iconImage:representedObject:](self, "initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:iconImage:representedObject:", a3, a4, 0, 0, 0, a5);
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 iconImage:(id)a7 representedObject:(id)a8
{
  return -[ICAutoCompleteSuggestionsItem initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:](self, "initWithDisplayText:shortText:uuidString:isEmptyPlaceholder:isSectionHeader:iconImage:representedObject:", a3, a4, a5, a6, 0, a7, a8);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (NSString)shortText
{
  return self->_shortText;
}

- (NSString)rightText
{
  return self->_rightText;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSString)parentNoteIdentifier
{
  return self->_parentNoteIdentifier;
}

- (BOOL)isEmptyPlaceholder
{
  return self->_isEmptyPlaceholder;
}

- (BOOL)isCreationSuggestion
{
  return self->_isCreationSuggestion;
}

- (BOOL)isSectionHeader
{
  return self->_isSectionHeader;
}

- (NSObject)representedObject
{
  return self->_representedObject;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_parentNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_rightText, 0);
  objc_storeStrong((id *)&self->_shortText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
