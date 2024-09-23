@implementation ARPixelBufferConvertYCbCrToARGB

size_t __ARPixelBufferConvertYCbCrToARGB_block_invoke@<X0>(CVPixelBufferRef pixelBuffer@<X1>, size_t planeIndex@<X2>, uint64_t a3@<X8>)
{
  size_t result;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)a3 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
  result = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 24) = result;
  return result;
}

@end
