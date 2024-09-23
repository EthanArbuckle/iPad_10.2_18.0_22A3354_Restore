@implementation CKReviewLargeAttachmentsViewController

- (CKReviewLargeAttachmentsViewController)init
{
  CKReviewLargeAttachmentsViewController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKReviewLargeAttachmentsViewController;
  v2 = -[CKReviewLargeAttachmentsViewController init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CKReviewLargeAttachmentsViewController", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)navigationBarTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATTACHMENTS"), &stru_1E276D870, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableViewCellReuseIdentifier
{
  return CFSTR("Attachments");
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (void)reloadModelData
{
  -[CKReviewLargeAttachmentsViewController setAttachments:](self, "setAttachments:", 0);
}

- (unint64_t)numberOfModelObjects
{
  void *v3;
  unint64_t v4;

  -[CKReviewLargeAttachmentsViewController _populateAttachmentData](self, "_populateAttachmentData");
  -[CKReviewLargeAttachmentsViewController attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)modelObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CKReviewLargeAttachmentsViewController _populateAttachmentData](self, "_populateAttachmentData");
  -[CKReviewLargeAttachmentsViewController attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deleteModelObjectAndUnderlyingData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *privateWorkQueue;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("guid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    privateWorkQueue = self->_privateWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CKReviewLargeAttachmentsViewController_deleteModelObjectAndUnderlyingData___block_invoke;
    block[3] = &unk_1E274A208;
    v12 = v5;
    dispatch_async(privateWorkQueue, block);

  }
  -[CKReviewLargeAttachmentsViewController attachments](self, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByExcludingObjectsInArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKReviewLargeAttachmentsViewController setAttachments:](self, "setAttachments:", v10);

}

uint64_t __77__CKReviewLargeAttachmentsViewController_deleteModelObjectAndUnderlyingData___block_invoke()
{
  return IMDAttachmentRecordDeleteAttachmentForGUID();
}

- (void)didSelectModelObjectAtIndex:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CKReviewLargeAttachmentsViewController _previewItem](self, "_previewItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CD3250], "canPreviewItem:", v4))
  {
    v5 = objc_alloc(MEMORY[0x1E0CD3250]);
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithPreviewItems:", v6);

    objc_msgSend(v7, "setDelegate:", self);
    -[CKReviewLargeAttachmentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    -[CKAbstractReviewViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForSelectedRow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKAbstractReviewViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v7, 1);

    }
  }

}

- (void)previewControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKAbstractReviewViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKAbstractReviewViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (id)attachmentClass
{
  return 0;
}

- (void)_populateAttachmentData
{
  CKReviewLargeAttachmentsViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CKReviewLargeAttachmentsViewController *v23;
  char *v24;
  id v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  -[CKReviewLargeAttachmentsViewController attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CKReviewLargeAttachmentsViewController attachmentClass](v2, "attachmentClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKReviewLargeAttachmentsViewController attachmentClass](v2, "attachmentClass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEnabled");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v10 = 0;
          v23 = v2;
          do
          {
            if ((unint64_t)objc_msgSend(v9, "count") > 0x63)
              break;
            v24 = v10;
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v11 = v6;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v28;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v28 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
                  v26 = 0;
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("filename"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = (void *)MEMORY[0x1E0D39640];
                  objc_msgSend(v17, "stringByExpandingTildeInPath");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "purgableFlagsForPath:error:", v19, &v26);

                  if (!v20 || (IM_APFS_PURGEABLE_IGNORE_ME() & v20) != 0)
                  {
                    v21 = (void *)objc_msgSend(v16, "copy");
                    objc_msgSend(v9, "addObject:", v21);

                  }
                  ++v15;
                }
                while (v13 != v15);
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
              }
              while (v13);
            }

            v2 = v23;
            v10 = v24 + 100;
            -[CKReviewLargeAttachmentsViewController attachmentClass](v23, "attachmentClass");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset();
            v6 = (void *)objc_claimAutoreleasedReturnValue();

          }
          while (objc_msgSend(v6, "count"));
        }
        -[CKReviewLargeAttachmentsViewController setAttachments:](v2, "setAttachments:", v9);

      }
      else
      {
        -[CKReviewLargeAttachmentsViewController setAttachments:](v2, "setAttachments:", v6);
      }

    }
    else
    {
      IMDAttachmentFindLargestNonSyncedAttachmentGUIDs();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[CKReviewLargeAttachmentsViewController setAttachments:](v2, "setAttachments:");

    }
  }
}

- (id)_previewItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKAbstractReviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKAbstractReviewViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "attachmentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
