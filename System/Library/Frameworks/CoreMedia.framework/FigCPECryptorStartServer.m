@implementation FigCPECryptorStartServer

uint64_t __FigCPECryptorStartServer_block_invoke(uint64_t a1)
{
  uint64_t result;
  const char *v3;
  _OWORD v4[3];

  v4[0] = xmmword_1E28E3FE0;
  v4[1] = *(_OWORD *)&off_1E28E3FF0;
  v4[2] = xmmword_1E28E4000;
  if (FigServer_IsMediaparserd())
  {
    result = FigSignalErrorAt(4294951145, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    if (FigServer_IsMediaplaybackd())
      v3 = "com.apple.coremedia.mediaplaybackd.figcpecryptor.xpc";
    else
      v3 = "com.apple.coremedia.figcpecryptor";
    result = FigXPCServerStart((uint64_t)v3, (uint64_t)v4, 0, &gFigCPECryptorServer);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
