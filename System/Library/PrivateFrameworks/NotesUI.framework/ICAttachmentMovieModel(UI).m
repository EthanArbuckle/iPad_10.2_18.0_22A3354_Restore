@implementation ICAttachmentMovieModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (void)drawPreviewInRect:()UI
{
  void *v9;
  void *v10;
  double MidX;
  double v12;
  double v13;
  double MidY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;

  objc_msgSend(a1, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawInRect:", a2, a3, a4, a5);

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_video_play"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  MidX = CGRectGetMidX(v21);
  objc_msgSend(v20, "size");
  v13 = MidX - v12 * 0.5;
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  MidY = CGRectGetMidY(v22);
  objc_msgSend(v20, "size");
  v16 = MidY - v15 * 0.5;
  objc_msgSend(v20, "size");
  v18 = v17;
  objc_msgSend(v20, "size");
  objc_msgSend(v20, "drawInRect:", v13, v16, v18, v19);

}

@end
