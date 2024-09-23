@implementation MPPlaybackContext(MPCSharedListening)

- (id)getSharedListeningTracklistWithCompletion:()MPCSharedListening
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1768];
  v4 = a3;
  objc_msgSend(v3, "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 1, CFSTR("Unsupported content (unknown subclass %@)"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v6);

  objc_msgSend(v5, "setCompletedUnitCount:", 1);
  return v5;
}

@end
