@implementation MIODefaultFrameProcessor

- (unsigned)encodedPixelFormat
{
  return CMFormatDescriptionGetMediaSubType(-[MIOFrameProcessor formatDesc](self, "formatDesc"));
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  return +[MIOPixelBufferUtility newPixelBufferRefCopy:attachmentKeysToCopy:](PixelBufferUtility, "newPixelBufferRefCopy:attachmentKeysToCopy:", a3, a4, a5);
}

@end
