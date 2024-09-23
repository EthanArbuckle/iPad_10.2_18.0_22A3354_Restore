@implementation ICAttachmentAudioModel

uint64_t __57__ICAttachmentAudioModel_UI__genericListThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_list_loading_audio"));
}

uint64_t __58__ICAttachmentAudioModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_note_loading_audio"));
}

@end
