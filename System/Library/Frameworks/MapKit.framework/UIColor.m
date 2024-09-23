@implementation UIColor

void __76__UIColor_MKAdditions___mapkit_userLocationAccuracyRingStrokeColorSatellite__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2D890;
  qword_1ECE2D890 = v0;

}

@end
