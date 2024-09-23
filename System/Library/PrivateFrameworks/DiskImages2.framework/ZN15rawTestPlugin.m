@implementation ZN15rawTestPlugin

_QWORD *___ZN15rawTestPlugin_t12subscriber_t8_executeEv_block_invoke(_QWORD *result)
{
  uint64_t **v1;
  uint64_t **v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t (*v5)(_QWORD);
  uint64_t *v6;
  unsigned int v7;
  unsigned int iov;

  v1 = (uint64_t **)result[5];
  v2 = (uint64_t **)result[6];
  if (v1 != v2)
  {
    v3 = result[4];
    v4 = (uint64_t (*)(_QWORD))MEMORY[0x24BDAF6A0];
    v5 = (uint64_t (*)(_QWORD))MEMORY[0x24BDAFA08];
    do
    {
      v6 = *v1;
      v7 = -45;
      switch(*(_BYTE *)*v1)
      {
        case 2:
          iov = rawTestPlugin_t::do_io<io_rings_sqe_op_read_iov_t>(*(_QWORD *)(v3 + 64), v6 + 3, v4);
          goto LABEL_7;
        case 4:
          iov = rawTestPlugin_t::do_io<io_rings_sqe_op_write_iov_t>(*(_QWORD *)(v3 + 64), v6 + 3, v5);
          goto LABEL_7;
        case 5:
          iov = rawTestPlugin_t::flush(*(rawTestPlugin_t **)(v3 + 64));
LABEL_7:
          v7 = iov;
          break;
        case 6:
          v7 = 0;
          break;
        default:
          break;
      }
      result = (_QWORD *)io_rings_return_status(*(_QWORD *)(v3 + 56), (uint64_t)v6, v7, 0);
      ++v1;
    }
    while (v1 != v2);
  }
  return result;
}

@end
