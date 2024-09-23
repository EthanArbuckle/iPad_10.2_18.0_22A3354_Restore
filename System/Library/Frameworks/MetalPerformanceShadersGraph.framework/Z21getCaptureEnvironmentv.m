@implementation Z21getCaptureEnvironmentv

char *___Z21getCaptureEnvironmentv_block_invoke()
{
  char *result;

  qword_1EDC0BF00 = (uint64_t)getenv("MPS_GRAPH_CAPTURE_OUTPUT_FOLDER");
  result = getenv("MPS_GRAPH_CAPTURE_GRAPH_NAME");
  qword_1EDC0BF08 = (uint64_t)result;
  return result;
}

@end
