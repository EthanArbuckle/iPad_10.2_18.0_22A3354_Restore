@implementation StringForPTEffectReactionType

id __bbn_StringForPTEffectReactionType_block_invoke()
{
  _QWORD v1[8];
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E49F92B8;
  v1[1] = &unk_1E49F92D0;
  v2[0] = CFSTR("ReactionThumbsUp");
  v2[1] = CFSTR("ReactionThumbsDown");
  v1[2] = &unk_1E49F92E8;
  v1[3] = &unk_1E49F9300;
  v2[2] = CFSTR("ReactionBalloons");
  v2[3] = CFSTR("ReactionHeart");
  v1[4] = &unk_1E49F9318;
  v1[5] = &unk_1E49F9330;
  v2[4] = CFSTR("ReactionFireworks");
  v2[5] = CFSTR("ReactionRain");
  v1[6] = &unk_1E49F9348;
  v1[7] = &unk_1E49F9360;
  v2[6] = CFSTR("ReactionConfetti");
  v2[7] = CFSTR("ReactionLasers");
  bbn_StringForPTEffectReactionType_sMapReactionTypeToName = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 8);
  return (id)bbn_StringForPTEffectReactionType_sMapReactionTypeToName;
}

@end
