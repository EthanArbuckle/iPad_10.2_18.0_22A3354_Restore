@implementation ICBackgroundTranscriptionHelper

+ (id)sharedInstance
{
  return objc_alloc_init(ICBackgroundTranscriptionHelper);
}

- (void)addFirstTimeTranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[ICBackgroundTranscriber sharedInstance](ICBackgroundTranscriber, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFirstTimeTranscriptionTaskToQueueWithMediaURL:attachmentIdentifier:subattachmentIdentifier:", v9, v8, v7);

}

- (void)addRetranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ICBackgroundTranscriber sharedInstance](ICBackgroundTranscriber, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRetranscriptionTaskToQueueWithSubattachmentAndMediaInfo:attachmentIdentifier:", v6, v5);

}

@end
