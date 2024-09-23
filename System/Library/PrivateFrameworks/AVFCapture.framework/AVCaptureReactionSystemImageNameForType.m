@implementation AVCaptureReactionSystemImageNameForType

id __AVCaptureReactionSystemImageNameForType_block_invoke()
{
  id result;
  _QWORD v1[9];
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v1[0] = AVCaptureReactionTypeThumbsUp;
  v1[1] = AVCaptureReactionTypeThumbsDown;
  v2[0] = CFSTR("hand.thumbsup.fill");
  v2[1] = CFSTR("hand.thumbsdown.fill");
  v1[2] = AVCaptureReactionTypeVictory;
  v1[3] = AVCaptureReactionTypeBalloons;
  v2[2] = CFSTR("balloon.2.fill");
  v2[3] = CFSTR("balloon.2.fill");
  v1[4] = AVCaptureReactionTypeHeart;
  v1[5] = AVCaptureReactionTypeFireworks;
  v2[4] = CFSTR("heart.fill");
  v2[5] = CFSTR("fireworks");
  v1[6] = AVCaptureReactionTypeRain;
  v1[7] = AVCaptureReactionTypeConfetti;
  v2[6] = CFSTR("cloud.rain.fill");
  v2[7] = CFSTR("party.popper.fill");
  v1[8] = AVCaptureReactionTypeLasers;
  v2[8] = CFSTR("laser.burst");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 9);
  AVCaptureReactionSystemImageNameForType_nameForType = (uint64_t)result;
  return result;
}

@end
