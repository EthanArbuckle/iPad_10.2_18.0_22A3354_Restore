@implementation ICAttachmentModel

uint64_t __52__ICAttachmentModel_UI__genericListThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_list_loading_file"));
}

uint64_t __53__ICAttachmentModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_note_loading_file"));
}

@end
