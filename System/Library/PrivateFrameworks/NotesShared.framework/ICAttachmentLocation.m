@implementation ICAttachmentLocation

- (NSString)formattedAddressWithoutAttachmentTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[ICLocation formattedAddress](self, "formattedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentLocation attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[ICAttachmentLocation attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "hasPrefix:", v8);

  if (v9)
  {
    -[ICAttachmentLocation attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v10, "length"));
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
LABEL_4:

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

+ (id)newAttachmentLocationForAttachment:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C97B20];
  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICAttachmentLocation"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttachment:", v4);
  return v6;
}

@end
