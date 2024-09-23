@implementation NSStream(NSStreamBoundPairCreationExtensions)

+ (__CFWriteStream)getBoundStreamsWithBufferSize:()NSStreamBoundPairCreationExtensions inputStream:outputStream:
{
  __CFReadStream *v7;
  __CFWriteStream *result;
  CFWriteStreamRef writeStream;
  CFReadStreamRef readStream[2];

  readStream[1] = *(CFReadStreamRef *)MEMORY[0x1E0C80C00];
  writeStream = 0;
  readStream[0] = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E0C9AE00], readStream, &writeStream, transferBufferSize);
  if (readStream[0])
  {
    v7 = readStream[0];
    if (a4)
      *a4 = readStream[0];
  }
  result = writeStream;
  if (writeStream)
  {
    result = writeStream;
    if (a5)
      *a5 = writeStream;
  }
  return result;
}

@end
